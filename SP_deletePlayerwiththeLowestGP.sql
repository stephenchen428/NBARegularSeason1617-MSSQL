/* 
	This proecure used to count the total number of players by 1 input parameter-TeamID
	if the total number of players greater than 17, it will delete the player who played 
	the lowest game in this season.
*/

create proc SP_deletePlayerwiththeLowestGP
	@TeamID	varchar(3)
as
	declare @count int

	select @count = count(*)
	from PlayerInfoCopy					 
	where TeamID=@TeamID

	if (@count >17)
		delete from PlayerInfoCopy
		output deleted.*
		 where PlayerID in (select top 1 with ties PlayerID
						   from PlayerInfoCopy
						   where teamID =@TeamID
						   order by GP)
	else
		print 'Cannot delete player(s). '

go

exec SP_deletePlayerwiththeLowestGP @TeamID='ATL';
	
select TeamID, Count(*) as TotalPlayer
from PlayerInfoCopy
where TeamID='ATL'
group by TeamID

select top 1 with ties *
from PlayerInfoCopy
where TeamID='ATL'
order by GP
/*PlayerID = 10154*/

select count(*) from PlayerInfoCopy where TeamID='ATL';

drop proc SP_deletePlayerwiththeLowestGP;




