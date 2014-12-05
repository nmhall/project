local unitName = "bug"

local unitDef = {
	name= "bug",
	unitname="bug",
	
	Description = "bug!",
	MaxDamage = 2000,
	category = [[LAND]],
	
	
	objectName = "bugNEW.s3o",
	Acceleration = 3,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 20,
    MaxWaterDepth = 300,
    MovementClass = "Default2x2",
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
            def = "buglaser",
			onlyTargetCategory = [[LAND]],
        },
    },
}

local weaponDefs = {
    buglaser = {
    name = "The Bug's short distance tazer",
    weapontype = "BeamLaser",
    accuracy = 0,
    areaofeffect = 0,
    avoidfeature = false,
    avoidfriendly = false,
    canattackground = true,
    collidefriendly = false,
	collideFeature = true,
	collideGround = true,
	noSelfDamage = true,
	impactOnly = true,
    collisionsize = 8,
    commandfire = true,
    craterboost = 0,
    cratermult = 0,
    edgeeffectiveness = 0.1,
    explosionspeed = 128,
    impulseboost = 0,
    impulsefactor = 0,
	minIntensity = 1.0,
    intensity = 1,
	radarRadius = 5000,
	alwaysVisible = true,
	
    size = 4,
--        soundstart = "tank_fire",
--        soundhit = "explo01",
    range = 100,
    reloadtime = .5,
    rgbcolor = ".5 .5 2.0",
    turret = true,
    texture1 = "flame",
--		explosiongenerator = "custom:TANKGUN_FX",
    damage =
    {
        default = 50,
		smartclass = 75,
		bitclass = 40,
    },
}
}

unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName] = unitDef })