class MG_PlayerController extends SimplePC;

var vector PlayerViewOffset;
var vector CurrentCameraLocation;
var vector DesiredCameraLocation;

var int TimeVar;

var rotator CurrentCameraRotation;

simulated function PostBeginPlay()
{
    local Vector Pawn_loc;
    Pawn_loc.Z = -256;
    Pawn.SetRelativeLocation(Pawn_loc);
}

function PlayerTick(float DeltaTime)
{
    super.PlayerTick(DeltaTime);

    if(Pawn != none)
    {
        DesiredCameraLocation = Pawn.Location + (PlayerViewOffset);

        CurrentCameraLocation += (DesiredCameraLocation - CurrentCameraLocation) * DeltaTime * TimeVar;
    }
}

simulated event GetPlayerViewPoint(out vector out_Location, out Rotator out_Rotation)
{
    super.GetPlayerViewPoint(out_Location, out_Rotation);

    if(Pawn != none)
    {
        Pawn.Mesh.SetOwnerNoSee(False);

        Pawn.Weapon.SetHidden(True);

        out_Location = CurrentCameraLocation;

        out_Rotation = rotator(Pawn.Location - out_Location);

        CurrentCameraRotation = out_Rotation;
    }
}

state PlayerWalking
{
    function ProcessMove(float DeltaTime, vector newAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
    {
        local vector X, Y, Z, AltAccel;

        GetAxes(CurrentCameraRotation, X, Y, Z);
        AltAccel = PlayerInput.aForward * Z + PlayerInput.aStrafe * Y;
        AltAccel.Z = 0;
        AltAccel = Pawn.AccelRate * Normal(AltAccel);
            
        super.ProcessMove(DeltaTime, AltAccel, DoubleClickMove, DeltaRot);
    }
}

DefaultProperties()
{
    TimeVar=12

    //PlayerViewOffset=(X=-242,Y=-394,Z=362)
    //PlayerViewOffset=(X=-384,Y=-384,Z=384)
    PlayerViewOffset=(X=-2048,Y=-2048,Z=2560)
}