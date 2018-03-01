/* Cannot delete player(s), if player PTS > 10 */

create trigger tri_CannotDeletedPlayer10points
on PlayerInfoCopy after delete
as
	if exists(select * from deleted
				where PTS > 10)
		begin
			print ' Cannot delete player(s), player PTS > 10.'
			rollback
		end
	else
		begin
			declare @count int;

			select * from deleted;

			select @count = count(*) from deleted;
			print convert(varchar, @count) + ' player(s) is/are deleted';
		end
go

begin tran

/* Player PTS>10 */
	delete from PlayerInfoCopy
	where PlayerID = 10029

/* Player PTS<10 */
	delete from PlayerInfoCopy
	where PlayerID in (10001, 10004, 10005)

rollback tran

drop trigger tri_CannotDeletedPlayer10points