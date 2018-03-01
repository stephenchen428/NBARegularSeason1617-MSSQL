/*
Create an after trigger on TeamInfo table. this trigger fires after insert and update. 
When user update or insert in TeamID column, the text will automatically change to upper case.
*/
create trigger Tri_TeamInfo_UpperTeamID
	on TeamInfo
	after insert, update
as
	update TeamInfo
	set TeamID = upper(TeamID)
	where TeamID in (select TeamID from inserted);

begin tran
	insert into teaminfo values ('bal','Baltimore Bullets','Southeast','Eastern' );
	select * from teaminfo;
rollback tran

