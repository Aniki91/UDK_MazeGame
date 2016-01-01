class MG_PowerupRed extends MG_Actor
        placeable;

var float velRotation;

function Tick(float DeltaTime)
{
    local float deltaRotation;
    local Rotator newRotation;

    deltaRotation = velRotation * DeltaTime;
    newRotation = Rotation;

    newRotation.Yaw  += deltaRotation;

    SetRotation(newRotation);
}

DefaultProperties()
{
    velRotation = 10000
    bCollideActors = true

    Begin Object Class=StaticMeshComponent Name=Powerup_Red
        StaticMesh=StaticMesh'MazeGameContent.Pickups.MG_PowerupRed'
        Scale3D=(X=3.0,Y=3.0,Z=3.0)
    End Object
    Components.Add(Powerup_Red)
}