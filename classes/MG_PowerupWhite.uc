class MG_PowerupWhite extends MG_Actor
        placeable;

var float velRotation;
var SoundCue PickupSound_1;
var SoundCue PickupSound_2;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
        PlaySound(PickupSound_1);
        PlaySound(PickupSound_2);
        Destroy();
}

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
    PickupSound_1 = SoundCue'MazeGameContent.Audio.MG_Buffer_Overloaded_Cue'
    PickupSound_2 = SoundCue'MazeGameContent.Audio.MG_Powerup_Cue'

    Begin Object Class=StaticMeshComponent Name=Powerup_White
        StaticMesh=StaticMesh'MazeGameContent.Pickups.MG_PowerupWhite'
        Scale3D=(X=3.0,Y=3.0,Z=3.0)
    End Object
    Components.Add(Powerup_White)
    
    Begin Object Class=CylinderComponent Name=CollisionCylinder
        CollisionRadius=16.0
        CollisionHeight=16.0
        BlockNonZeroExtent=true
        BlockZeroExtent=true
        BlockActors=true
        CollideActors=true
    End Object
        CollisionComponent=CollisionCylinder
        Components.Add(CollisionCylinder)
}