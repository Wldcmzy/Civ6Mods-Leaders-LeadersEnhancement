-- _
-- Author: wldcmzy
-- DateCreated: 3/11/2024 8:40:32 PM
--------------------------------------------------------------


function Leader_Grimm_ChangeYieldFromCulture_PerTurnEnd()
	local gainPercentage = 0.03

	local AlivePlayerList = PlayerManager.GetAlive()

	for each in pairs(AlivePlayerList) do
		local iplayer = each-1
		local pPlayerConfig = PlayerConfigurations[iplayer]
		local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
		local LeaderName = pPlayerConfig:GetLeaderTypeName()

		if (CivilizationName == 'CIVILIZATION_MALI' and LeaderName == 'LEADER_MANSA_MUSA') then
			local T = Players[iplayer]:GetTreasury()
			T:ChangeGoldBalance(T:GetGoldBalance() * gainPercentage)
		end
	end
end

Events.TurnBegin.Add(Leader_Grimm_ChangeYieldFromCulture_PerTurnEnd)