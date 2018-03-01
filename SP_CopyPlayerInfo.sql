/*
This procedure checks if PlayerInfoCopy table exists. If exists, it drops the
table, then, it copy the PlayerInfo table to PlayerInfoCopy.
*/

create proc sp_CopyPlayerInfo
as
	if object_id('PlayerInfoCopy') is not null
		drop table PlayerInfoCopy;
	
	select * into PlayerInfoCopy
	from PlayerInfo;
go

exec sp_CopyPlayerInfo
	

