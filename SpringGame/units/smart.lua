local unitName = "smart"

local unitDef = {
	name= "smart",
	unitname="smart",
	
	Description = "bug!",
	MaxDamage = 2000,
	category = [[LAND]],
	
	
	objectName = "assembler.s3o",
	Acceleration = 1,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 5,
    MaxWaterDepth = 300,
    MovementClass = "Default4x4",
    TurnRate = 900,
	
	--Abilities
    Builder = 0,
    CanAttack = 1,
    CanGuard = 1,
    CanMove = 1,
    CanPatrol = 1,
    CanStop = 1,
    LeaveTracks = 0,
    Reclaimable = 0,
	 
	 weapons = {
        [1] = {
            def = "smartblob",
			onlyTargetCategory = [[LAND]],
        },
    },
}

local weaponDefs = {
    smartblob = {
    name = "Orange Plasma Cannon",
    weapontype = "StarburstLauncher",
    accuracy = 10,
    areaofeffect = 100,
    avoidfeature = false,
    avoidfriendly = false,
    canattackground = true,
    collidefriendly = false,
	collideFeature = true,
	collideGround = true,
	noSelfDamage = true,
	impactOnly = true,
    collisionsize = 8,
    commandfire = false,
    craterboost = 0,
    cratermult = 0,
    edgeeffectiveness = 0.1,
    explosionspeed = 128,
    impulseboost = 0,
    impulsefactor = 0,
    intensity = 1,
	turret=1;
	range=1250;
	weaponvelocity=3000;
	startvelocity=0;
	weaponacceleration=1750;
	fixedLauncher=1;
 	smoketrail=1;
	tracks=1;
	guided=1;
	weapontimer=.1;
    noselfdamage = true,
	radarRadius = 5000,
	alwaysVisible=true,
    size = 20,
--        soundstart = "tank_fire",
--        soundhit = "explo01",
    reloadtime = 4,
    rgbcolor = "1.0 1.0 1.0",
    texture1 = "flame",
--		explosiongenerator = "custom:TANKGUN_FX",
    damage =
    {
        default = 400,
		bitclass = 500,
    },
    },
}

unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName] = unitDef })