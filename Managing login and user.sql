/*Manage database security*/

/* create a new SQL Server login called 'test'*/
create login test with password ='12345', CHECK_POLICY = off;

/*create a Windows-authenticated login*/
create login [NBA\test0] from windows with default_database = [NBARegularSeason1617];

/*Switch the current login to [NBA\test0]*/
execute as login = 'test';
/*Display current login*/ 
select SUSER_NAME(), USER_NAME();

/*Switch the [NBA\test0] to previous login */
revert;

/*alter login*/
alter login test enable;
alter login test disable;
alter login test with name = test0;
alter login test0 with password = 'test12345';

/* drop login*/
drop login test0;

/*create user*/
create user testuser for login test0;

/*create schema */
create schema Accounting;

/*alter user*/
alter user testuser with DEFAULT_SCHEMA=Accounting;

/*drop user*/
drop user testuser;

/*grant and revoke object permissions */
grant select on TeamInfo to testuser;
grant insert, update on TeamInfo to testuser;
revoke insert, update on TeamInfo to testuser;

use master;
grant alter any database to test0;
grant alter any login to test0;
revoke alter any login to test0;

/*Fixed server roles*/
  /*dbcreator grants create, alter, drop, and restore databases to login*/
alter server role dbcreator add member test0;

/*Fixed database roles*/
  /*db_owner grants all permissions for the database to user*/ 
alter role db_owner add member testuser;
alter role db_owner drop member testuser;
  /*db_datawriter grants insert, update, delete permissions to user*/
alter role db_datawriter add testuser;

/*User-defined database role*/
	/*create a user-defined database role called exam*/
create role udr_exam;
	/*work with the User-defined database role*/
alter role db_datareader add member udr_exam;
grant insert on PlayerInfo to udr_exam;
deny delete on PlayerInfo to udr_exam;

/* Assign memberships to udr_exam*/
alter role udr_exam add member testuser;



