local CATEGORY_NAME = "Health"

function ulx.heal( calling_ply, target_plys )
	for i=1, #target_plys do
		local v = target_plys[ i ]
		GAMEMODE.PlayerDamage:HealPlayerLimbs( v )

		v:SetHealth( v:GetMaxHealth() )
	end
	ulx.fancyLogAdmin( calling_ply, true, "#A healed #T", target_plys )
end
local heal = ulx.command( CATEGORY_NAME, "ulx heal", ulx.heal, "!heal" )
heal:addParam{ type=ULib.cmds.PlayersArg }
heal:defaultAccess( ULib.ACCESS_ADMIN )
heal:help( "Heals targets." )

function ulx.revive( calling_ply, target_plys )
	for i=1, #target_plys do
		local v = target_plys[ i ]
		if v:IsUncon() then
			v:WakeUp()
		elseif v:IsRagdolled() then
			v:UnRagdoll()
		end
		
	end
	ulx.fancyLogAdmin( calling_ply, true, "#A revived #T", target_plys )
end
local revive = ulx.command( CATEGORY_NAME, "ulx revive", ulx.revive, "!revive" )
revive:addParam{ type=ULib.cmds.PlayersArg }
revive:defaultAccess( ULib.ACCESS_ADMIN )
revive:help( "Revives targets." )

