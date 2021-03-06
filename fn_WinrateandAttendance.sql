/* This function returns a table with teamID, team win percentage, and total
   attendances, which win percentage is between 2 values defined by 2 input 
   parameters.
*/

create function fn_WinrateandAttendance
	(@min float, @max float)
	returns table
return
	(select tp.TeamID, tp.[W%], a.TotalAttendances
	 from TeamScore_percentage tp inner join Attendances a 
									on a.TeamID = tp.TeamID
									and [W%] between @min and @max
	 )

select * from dbo.fn_WinrateandAttendance(60,80)
