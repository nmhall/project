package main;

import com.springrts.ai.AI;
import com.springrts.ai.oo.AIFloat3;
import com.springrts.ai.oo.CallbackAIException;
import com.springrts.ai.oo.OOAI;
import com.springrts.ai.oo.clb.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Hashtable;
import java.util.Properties;
import java.util.List;
import java.util.Random;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.*;

/**
 * Serves as Interface for a Java Skirmish AIs for the Spring engine.
 *
 * @author	hoijui
 */
public class MyJavaAI extends OOAI implements AI {

	private static class MyCustomLogFormatter extends Formatter {

		private DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss:SSS dd.MM.yyyy");

		public String format(LogRecord record) {

			// Create a StringBuffer to contain the formatted record
			// start with the date.
			StringBuffer sb = new StringBuffer();

			// Get the date from the LogRecord and add it to the buffer
			Date date = new Date(record.getMillis());
			sb.append(dateFormat.format(date));
			sb.append(" ");

			// Get the level name and add it to the buffer
			sb.append(record.getLevel().getName());
			sb.append(": ");

			// Get the formatted message (includes localization
			// and substitution of paramters) and add it to the buffer
			sb.append(formatMessage(record));
			sb.append("\n");

			return sb.toString();
		}
	}

	private static void logProperties(Logger log, Level level, Properties props) {

		log.log(level, "properties (items: " + props.size() + "):");
		for (String key : props.stringPropertyNames()) {
			log.log(level, key + " = " + props.getProperty(key));
		}
	}

	private int skirmishAIId = -1;
	private int teamId = -1;
	private Properties info = null;
	private Properties optionValues = null;
	private OOAICallback clb = null;
	private String myLogFile = null;
	private Logger log = null;

	private Boolean setupEnemies = false;
	private List<Unit> enemies = new ArrayList<Unit>();
	private List<Unit> my_units = new ArrayList<Unit>();
	private final Lock _mutex = new ReentrantLock(true);
	private int NUMBER_OF_ENEMIES = 3;
	
	
	private Hashtable<Unit, List<Unit>> unitTargets = new Hashtable<Unit, List<Unit>>();
	private static final int DEFAULT_ZONE = 0;
	

	public MyJavaAI() {}

	private int sendTextMsg(String msg) {

		try {
			clb.getGame().sendTextMessage(msg, DEFAULT_ZONE);
		} catch (Exception ex) {
			ex.printStackTrace();
			return 1;
		}

		return 0;
	}
	public boolean isDebugging() {
		return true;
	}

	@Override
	public int init(int skirmishAIId, OOAICallback callback) {

		int ret = -1;

		this.skirmishAIId = skirmishAIId;
		this.clb = callback;

		this.teamId = clb.getSkirmishAI().getTeamId();

		info = new Properties();
		Info inf = clb.getSkirmishAI().getInfo();
		int numInfo = inf.getSize();
		for (int i = 0; i < numInfo; i++) {
			String key = inf.getKey(i);
			String value = inf.getValue(i);
			info.setProperty(key, value);
		}

		optionValues = new Properties();
		OptionValues opVals = clb.getSkirmishAI().getOptionValues();
		int numOpVals = opVals.getSize();
		for (int i = 0; i < numOpVals; i++) {
			String key = opVals.getKey(i);
			String value = opVals.getValue(i);
			optionValues.setProperty(key, value);
		}

		// initialize the log
		try {
			myLogFile = callback.getDataDirs().allocatePath("log-team-" + teamId + ".txt", true, true, false, false);
			FileHandler fileLogger = new FileHandler(myLogFile, false);
			fileLogger.setFormatter(new MyCustomLogFormatter());
			fileLogger.setLevel(Level.ALL);
			log = Logger.getLogger("nulloojavaai");
			log.addHandler(fileLogger);
			if (isDebugging()) {
				log.setLevel(Level.ALL);
			} else {
				log.setLevel(Level.INFO);
			}
		} catch (Exception ex) {
			System.out.println("NullOOJavaAI: Failed initializing the logger!");
			ex.printStackTrace();
			ret = -2;
		}

		try {
			/*
			log.info("initializing team " + teamId);
			log.log(Level.FINE, "info:");
			logProperties(log, Level.FINE, info);
			log.log(Level.FINE, "options:");
			logProperties(log, Level.FINE, optionValues);
	*/
			ret = 0;
		} catch (Exception ex) {
			log.log(Level.SEVERE, "Failed initializing", ex);
			ret = -3;
		}

		return ret;
	}

	@Override
	public int release(int reason) {
		return 0; // signaling: OK
	}

	@Override
	public int update(int frame) {
		
		//Reset the list of enemies every 100 frames
		if(!setupEnemies){
			//THIS IS A HACK 
			if((this.clb.getEnemyUnits().size() == this.NUMBER_OF_ENEMIES) && (!setupEnemies)){
				sendTextMsg("Assigning enemies");
				assignEnemies();
			}
		}
		else if(this.clb.getEnemyUnits().size() != 0)
		{	
			
			_mutex.lock();
			for(Unit unit : this.my_units) {
				//sendTextMsg(String.valueOf(this.unitTargets.get(unit).size()));
				Unit enemy = this.unitTargets.get(unit).get(0);
				
				try {
			       unit.attack(enemy,emptyOptions(), 10000);
			     } catch (CallbackAIException ex) {
			        	AIFloat3 clippedPos = clipToMap(enemy.getPos());
						
						//When the move is done, the unit will become idle and attack
						try {
				            unit.moveTo(clippedPos, emptyOptions(), 10000);
				        } catch (CallbackAIException ex1) {
				        	sendTextMsg(ex1.getMessage());
				        }
				        
			        }
			}
			_mutex.unlock();
			
		}
		else{}

		return 0; // signaling: OK
	}
	
	private int assignEnemies() {
		
		long seed = System.nanoTime();
		List<Unit> enemies = this.clb.getEnemyUnits();
		
		
		for(Unit unit: my_units){
			Collections.shuffle(enemies, new Random(seed));
			this.unitTargets.put(unit, enemies);
		}
		this.setupEnemies = true;
		return 0;
	}
	
	
	@Override
	public int message(int player, String message) {
		return 0; // signaling: OK
	}

	@Override
	public int unitCreated(Unit unit, Unit builder) {

		int ret = sendTextMsg("unitCreated: " + unit.toString() + " team " + unit.getTeam() );
		
		if(unit.getTeam() == this.clb.getGame().getMyTeam()){
			my_units.add(unit);
		}
		

		final List<Unit> enemies = this.clb.getEnemyUnits();
		//enemyBit = enemies.get(0);
		
		//sendTextMsg("got enemies there are " + enemies.size());
		/*
		AIFloat3 clippedPos = clipToMap(enemyBit.getPos());
		clippedPos.x += 128;
		sendTextMsg("trying to move");
		
		try {
            unit.moveTo(clippedPos, emptyOptions(), 10000);
        } catch (CallbackAIException ex) {
            sendTextMsg(ex.getMessage());
        }
		*/
		/*
		List<UnitDef> buildOptions = unit.getDef().getBuildOptions();
		for (UnitDef unitDef : buildOptions) {
			sendTextMsg("\tbuildOption x: " + unitDef.getName() + "\t" + unitDef.getHumanName() + "\t" + unitDef.toString() + "\t" + unitDef.hashCode());
		}
	*/
		return ret;
	}

	@Override
	public int unitFinished(Unit unit) {
		/*
		int ret = sendTextMsg("unitFinshed: " + unit.toString());
		sendTextMsg("unitFinished def: " + unit.getDef().getName());
		*/
		return 0; // signaling: OK
	}

	@Override
	public int unitIdle(Unit unit) {
		//sendTextMsg("Unit is idle ");
		
		try {
            //idle_units.get(0).attack(enemies.get(0),emptyOptions(), 10000);
        } catch (CallbackAIException ex) {
            sendTextMsg(ex.getMessage());
        }
		
		return 0;
	}

	@Override
	public int unitMoveFailed(Unit unit) {
		return 0; // signaling: OK
	}

	@Override
	public int unitDamaged(Unit unit, Unit attacker, float damage, AIFloat3 dir, WeaponDef weaponDef, boolean paralyzed) {
		return 0; // signaling: OK
	}

	@Override
	public int unitDestroyed(Unit unit, Unit attacker) {
		sendTextMsg("enemy destroyed ");
		
		_mutex.lock();
		this.my_units.remove(unit);
		_mutex.unlock();
		
		return 0; // signaling: OK
	}

	@Override
	public int unitGiven(Unit unit, int oldTeamId, int newTeamId) {
		return 0; // signaling: OK
	}

	@Override
	public int unitCaptured(Unit unit, int oldTeamId, int newTeamId) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyEnterLOS(Unit enemy) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyLeaveLOS(Unit enemy) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyEnterRadar(Unit enemy) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyLeaveRadar(Unit enemy) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyDamaged(Unit enemy, Unit attacker, float damage, AIFloat3 dir, WeaponDef weaponDef, boolean paralyzed) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyDestroyed(Unit enemy, Unit attacker) {
		sendTextMsg("enemy destroyed ");
		
		_mutex.lock();
		for(Unit myUnit: this.my_units){
			
			List<Unit> currentTargets = this.unitTargets.get(myUnit);
			currentTargets.remove(enemy);
			this.unitTargets.put(myUnit, currentTargets);
			
		}
		_mutex.unlock();
		return 0; // signaling: OK
	}

	@Override
	public int weaponFired(Unit unit, WeaponDef weaponDef) {
		return 0; // signaling: OK
	}

	@Override
	public int playerCommand(java.util.List<Unit> units, int commandTopicId, int playerId) {
		return 0; // signaling: OK
	}

	@Override
	public int commandFinished(Unit unit, int commandId, int commandTopicId) {
		return 0; // signaling: OK
	}

	@Override
	public int seismicPing(AIFloat3 pos, float strength) {
		return 0; // signaling: OK
	}

	@Override
	public int load(String file) {
		return 0; // signaling: OK
	}

	@Override
	public int save(String file) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyCreated(Unit enemy) {
		return 0; // signaling: OK
	}

	@Override
	public int enemyFinished(Unit enemy) {
		return 0; // signaling: OK
	}
	
    public static short emptyOptions() {
        return 0;
    }
    

    private AIFloat3 clipToMap(AIFloat3 pos) {
        AIFloat3 clippedPos = new AIFloat3(pos);

        if (clippedPos.x > this.clb.getMap().getWidth() * 8)
            clippedPos.x = this.clb.getMap().getWidth() * 8;
        if (clippedPos.z > this.clb.getMap().getHeight() * 8)
            clippedPos.z = this.clb.getMap().getHeight() * 8;
        if (clippedPos.x < 0)
            clippedPos.x = 0;

        if (clippedPos.y < 0)
            clippedPos.y = 0;

        return clippedPos;
    }    
}