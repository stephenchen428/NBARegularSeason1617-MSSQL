/* This function returns a table with players with the highest PTS in the team */

create function fn_teamstar
	(@TeamID varchar(3))
returns table
as
return
	select t.TeamID, t.TeamName, p.PlayerFName, p.PlayerLName, MaxPts.PlayerPTS
	from TeamInfo t, PlayerInfo p,
		(select teamID, Max(PTS) as PlayerPTS
		from playerInfo
		group by teamID) as MaxPts 
	where t.teamID = p.teamID
		and t.teamID = MaxPts.teamID
		and p.PTS = MaxPts.PlayerPTS
		and t.TeamID = @TeamID


select fn.*,c.CoachFName,c.CoachLName
from fn_teamstar('HOU') fn, CoachInfo c
where c.TeamID=fn.TeamID

	
	



