class MG_PowerupBlue extends MG_Actor
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

        Begin Object Class=StaticMeshComponent Name=Powerup_Blue
        StaticMesh=StaticMesh'MazeGameContent.Pickups.MG_PowerupBlue'
        Scale3D=(X=3.0,Y=3.0,Z=3.0)
    End Object
    Components.Add(Powerup_Blue)
}