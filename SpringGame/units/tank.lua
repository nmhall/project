local unitName  =  "tank"

local unitDef  =  {

  name               = "Cube Unit",
  objectName         = "cube.s3o",
  
  --Pathfinding and related
    Acceleration = 1,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 10,
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
}

return lowerkeys({ [unitName] = unitDef })