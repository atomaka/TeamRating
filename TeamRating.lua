TeamRating = CreateFrame("frame");
TeamRating:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end);
TeamRating:RegisterEvent("UPDATE_BATTLEFIELD_STATUS");

function TeamRating:UPDATE_BATTLEFIELD_STATUS(event,...)
	isUnratedArena,isRatedArena = IsActiveBattlefieldArena();
	if(isRatedArena) then
		battlefieldWinner = GetBattlefieldWinner();
		if(battlefieldWinner == nil) then
			return;
		end
		
		teamName0,oldTeamRating0,newTeamRating0,matchMakingRating0 = GetBattlefieldTeamInfo(0);
		teamName1,oldTeamRating1,newTeamRating1,matchMakingRating1 = GetBattlefieldTeamInfo(1);
		
		SendChatMessage(teamName0 .. " (now: " .. newTeamRating0 .. "; before: " .. oldTeamRating0 .. "; mmr: " .. matchMakingRating0 .. ").","PARTY");
		SendChatMessage(teamName1 .. " (now: " .. newTeamRating1 .. "; before: " .. oldTeamRating1 .. "; mmr: " .. matchMakingRating1 .. ").","PARTY");
	end
end