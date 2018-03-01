/* create a scalar-valued function 
   this function return the total number of players whose fidld goal
   percentage is between 2 values defined by 2 input parameters.
*/

create function fn_PlayerFTRate
	(@min float, @max float)
	returns int
begin
	return (select count(*) from PlayerInfo_percentage
			where [FT%] between @min and @max)
end

print dbo.fn_PlayerFTRate(40,50);
select dbo.fn_PlayerFTRate(40,50);