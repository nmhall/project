local unitName = "alice"

local unitDef = {
	name= "alice",
	unitname="alice",
	
	Description = "dummy unit that does not attack or move",
	MaxDamage = 100,
	category = [[LAND]],
	
	
	objectName = "alice.s3o",
	Acceleration = 0,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 0,
    MaxWaterDepth = 300,
    MovementClass = "Default2x2",
    TurnRate = 0,
	ExplodeAs = "TANKDEATH",
	
	--Abilities
    Builder = 0,
    CanAttack = 0,
    CanGuard = 1,
    CanMove = 0,
    CanPatrol = 0,
    CanStop = 1,
    LeaveTracks = 0,
    Reclaimable = 0,
	
}

return lowerkeys({ [unitName] = unitDef })