/* return the number of players in a team*/

create proc SP_CountPlayer
	@TeamID	varchar(3),
	@count int output
as
	select @count = count(*)
	from PlayerInfo					 
	where TeamID=@TeamID
go
	
declare @countplayer int
exec SP_CountPlayer @TeamID='CHI', @count=@countplayer output;
print 'There are ' + convert(varchar, @countplayer) + ' players.'