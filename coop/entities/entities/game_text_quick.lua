
ENT.Type = "point"

function ENT:Initialize()
end

function ENT:KeyValue( key, value )
	--print(self:GetClass(), key, value)
end

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	if inputName == "DisplayText" then
		oc.quickmsg(data)
	end
end
/*
function ENT:UpdateTransmitState()

	return TRANSMIT_NEVER

end
*/