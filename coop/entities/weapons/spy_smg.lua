AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MP5"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.6
	SWEP.ZoomAmount = 5
	SWEP.AimPos = Vector(-8.75, -9, 4.1)
	SWEP.AimAng = Vector(-1.35, -.35, -2)
end

SWEP.Category = "NutScript - Spy Base"
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 30
SWEP.BulletLength = 5.45
SWEP.CaseLength = 39

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.HoldType = "ar2"
SWEP.Base = "spy_base"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_mp5.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV	= 60
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.092
SWEP.FireSound = Sound("Weapon_MP5Navy.Single")
SWEP.Recoil = 1


SWEP.Spread = 0.007
SWEP.CrouchSpread = 0.005
SWEP.VelocitySensitivity = 3.5
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 1
SWEP.ReloadTime = 1.75
SWEP.muzScale = .4

function SWEP:ViewMuzzleFlash()
	if !self.Owner:ShouldDrawLocalPlayer() then
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		local at = vm:LookupAttachment( "1" )
		local atpos = vm:GetAttachment( at )
		local e = EffectData()
		e:SetOrigin( atpos.Pos )
		e:SetNormal( atpos.Ang:Up() * -1 )
		e:SetScale( self.muzScale or .2 )
		util.Effect( "muzzleflosh" , e)
	end
end
	function SWEP:WorldMuzzleFlash()
		if !self.delayWorldMuzzle or self.delayWorldMuzzle < CurTime() then
			local at = self:LookupAttachment( "muzzle" )
			local atpos = self:GetAttachment( at )
			local e = EffectData()
			e:SetOrigin( atpos.Pos )
			e:SetNormal( atpos.Ang:Forward() * 1 )
			e:SetScale( self.muzScale/2 or .1 )
			util.Effect( "muzzleflosh" , e)
			self:BeLight( atpos.Pos )
		end
	end