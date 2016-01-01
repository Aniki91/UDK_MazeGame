class MG_Pawn extends Pawn;

var ParticleSystemComponent Template;
var PointLightComponent PlayerLight;
var Color c;

event PostBeginPlay()
{
    PlayerLight.setLightProperties(1,c);
}

DefaultProperties()
{
    c=(R=240,G=230,B=140,A=0)

    Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
        bEnabled=True
    End Object
    Components.Add(MyLightEnvironment)

    Begin Object Class=CylinderComponent Name=MyCollisionCylinder
        CollisionRadius=24.0
        CollisionHeight=128.0
        BlockNonZeroExtent=True
        BlockZeroExtent=True
        BlockActors=True
        CollideActors=True
    End Object
    CollisionComponent=MyCollisionCylinder
    Components.Add(MyCollisionCylinder)

    Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0
        Template=ParticleSystem'WP_LinkGun.Effects.P_FX_LinkGun_3P_Beam_MF_Gold'
        Scale3D=(X=3.0,Y=3.0,Z=3.0)
    End Object
        Template=ParticleSystemComponent0
        Components.Add(ParticleSystemComponent0)

        Begin Object Class=SpriteComponent Name=P_Sprite
        Sprite = S_Actor
        HiddenGame=true
    End Object
    Components.Add(P_Sprite)
    
        Begin Object Class=PointLightComponent Name=MyPlayerLight
        bEnabled=True
        Radius=256.000000
        Brightness=0.0
    End Object
    Components.Add(MyPlayerLight)
    PlayerLight=MyPlayerLight
}