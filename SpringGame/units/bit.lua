local unitName = "bit"

local unitDef = {
	name= "bit",
	unitname="bit",
	
	Description = "generic low range unit",
	MaxDamage = 2000,
	category = [[LAND]],
	
	
	objectName = "ball.s3o",
	Acceleration = 1,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 10,
    MaxWaterDepth = 300,
    MovementClass = "Default3x3",
    TurnRate = 900,
	ExplodeAs = "TANKDEATH",
	
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
            def = "bitgun",
			onlyTargetCategory = [[LAND]],
        },
    },
}

local weaponDefs = {
    bitgun = {
	name="3d Geometric shapes!!";
	rendertype=1;
	lineofsight=1;
	--ballistic=1;
	model="network_medium_missile.s3o";
	--Texture1=none;
	Texture2=flowtrail;
	--Texture3=none;
	weapontype=StarburstLauncher;
	avoidfeature = false,
    avoidfriendly = false,
    canattackground = true,
    collidefriendly = false,
	collideFeature = true,
	collideGround = true,
	noSelfDamage = true,
	impactOnly = true,
	turret=1;
	range=350;
	weaponvelocity=2000;
	startvelocity=400;
	weaponacceleration=600;
	fixedLauncher=1;
 	smoketrail=1;
	tracks=1;
	guided=1;
	weapontimer=.1;
	turnrate=60000;
	flighttime=5;
	radarRadius = 5000,

	burst=2;
	burstrate=.3;
	projectiles=2;

	reloadtime=2;

	areaofeffect=128;
	collidefriendly=0;
	avoidfriendly=0;

	tolerance=3000;

	impulsefactor=0;
	impulseBoost=0;
	craterMult=0;
	craterBoost=0;
	alwaysVisible = true,

	interceptedbyshieldtype=1;
	damage =
		{
		default=100,
		bugclass = 150,
		smartclass = 50,
		}
	}
}

unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName] = unitDef })