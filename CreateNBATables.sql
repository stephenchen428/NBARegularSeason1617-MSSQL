Create database NBARegularSeason1617;

Use NBARegularSeason1617;

CREATE TABLE TeamInfo (
   TeamID varchar(3) NOT NULL,
   TeamName varchar(30) NOT NULL,
   Division varchar(20) NOT NULL,
   Conference varchar(20) NOT NULL,
   constraint PK_TeamID primary key(TeamID),
   constraint UK_TeamName unique(TeamName)
);
go

CREATE TABLE Attendances (
  TeamID VARCHAR(3) NOT NULL,
  TotalAttendances INT NULL,
  constraint PK_Attendances PRIMARY KEY (TeamID),
  constraint FK_Attendances FOREIGN KEY (TeamID)
    REFERENCES TeamInfo (TeamID) ON DELETE CASCADE ON UPDATE CASCADE
);
go

CREATE TABLE TeamScore(
  TeamID VARCHAR(3) NOT NULL,
  GP FLOAT NOT NULL DEFAULT 0,
  W FLOAT NOT NULL DEFAULT 0,
  L FLOAT NOT NULL DEFAULT 0,
  Min DECIMAL(5,1) NOT NULL DEFAULT 0,
  PTS DECIMAL(5,1) NOT NULL DEFAULT 0,
  FGM DECIMAL(5,1) NOT NULL DEFAULT 0,
  FGA DECIMAL(5,1) NOT NULL DEFAULT 0,
  [3PM] DECIMAL(5,1) NOT NULL DEFAULT 0,
  [3PA] DECIMAL(5,1) NOT NULL DEFAULT 0,
  FTM DECIMAL(5,1) NOT NULL DEFAULT 0,
  FTA DECIMAL(5,1) NOT NULL DEFAULT 0,
  OREB DECIMAL(5,1) NOT NULL DEFAULT 0,
  DREB DECIMAL(5,1) NOT NULL DEFAULT 0,
  AST DECIMAL(5,1) NOT NULL DEFAULT 0,
  TOV DECIMAL(5,1) NOT NULL DEFAULT 0,
  STL DECIMAL(5,1) NOT NULL DEFAULT 0,
  BLK DECIMAL(5,1) NOT NULL DEFAULT 0,
  BLKA DECIMAL(5,1) NOT NULL DEFAULT 0,
  PF DECIMAL(5,1) NOT NULL DEFAULT 0,
  CONSTRAINT PK_TeamScore PRIMARY KEY (TeamID),
  CONSTRAINT FK_TeamScore FOREIGN KEY (TeamID) 
	REFERENCES TeamInfo (TeamID) ON DELETE CASCADE ON UPDATE CASCADE
);
go


CREATE TABLE CoachInfo (
  CoachID INT NOT NULL IDENTITY(20001,1),
  CoachFName VARCHAR(20) NOT NULL,
  CoachLName VARCHAR(20) NOT NULL,
  TeamID VARCHAR(3) NULL,
  StartedYear INT NULL,
  GC FLOAT NOT NULL DEFAULT 0,
  W FLOAT NOT NULL DEFAULT 0,
  L FLOAT NOT NULL DEFAULT 0,
  CONSTRAINT PK_CoachInfo PRIMARY KEY (CoachID),
  CONSTRAINT FK_CoachInfo FOREIGN KEY (TeamID)
    REFERENCES teaminfo (TeamID) ON DELETE SET NULL ON UPDATE SET NULL
); 
go

CREATE TABLE playerinfo(
	PlayerID INT NOT NULL IDENTITY(10001,1),
    PlayerFName VARCHAR(25) NOT NULL,
    PlayerLName VARCHAR(25) NOT NULL,
    TeamID VARCHAR(3) NULL,
    GP FLOAT NOT NULL DEFAULT 0,
    Min DECIMAL(5,1) NOT NULL DEFAULT 0,
    PTS DECIMAL(5,1) NOT NULL DEFAULT 0,
	FGM DECIMAL(5,1) NOT NULL DEFAULT 0,
	FGA DECIMAL(5,1) NOT NULL DEFAULT 0,
	[3PM] DECIMAL(5,1) NOT NULL DEFAULT 0,
	[3PA] DECIMAL(5,1) NOT NULL DEFAULT 0,
	FTM DECIMAL(5,1) NOT NULL DEFAULT 0,
	FTA DECIMAL(5,1) NOT NULL DEFAULT 0,
	OREB DECIMAL(5,1) NOT NULL DEFAULT 0,
	DREB DECIMAL(5,1) NOT NULL DEFAULT 0,
	AST DECIMAL(5,1) NOT NULL DEFAULT 0,
	TOV DECIMAL(5,1) NOT NULL DEFAULT 0,
	STL DECIMAL(5,1) NOT NULL DEFAULT 0,
	BLK DECIMAL(5,1) NOT NULL DEFAULT 0,
    PF DECIMAL(5,1) NOT NULL DEFAULT 0,
    PRIMARY KEY (PlayerID),
    CONSTRAINT FK_playerInfo FOREIGN KEY (TeamID)
    REFERENCES teaminfo (TeamID) ON DELETE SET NULL ON UPDATE SET NULL
);


/*Insert rows */
insert into TeamInfo values ('ATL','Atlanta Hawks','Southeast','Eastern' );
insert into TeamInfo values ('BOS','Boston Celtics','Atlantic','Eastern' );
insert into TeamInfo values ('BKN','Brooklyn Nets','Atlantic','Eastern' );
insert into TeamInfo values ('CHA','Charlotte Hornets','Southeast','Eastern' );
insert into TeamInfo values ('CHI','Chicago Bulls','Central','Eastern' );
insert into TeamInfo values ('CLE','Cleveland Cavaliers','Central','Eastern' );
insert into TeamInfo values ('DAL','Dallas Mavericks','Southwest','Western' );
insert into TeamInfo values ('DEN','Denver Nuggets','Northwest','Western' );
insert into TeamInfo values ('DET','Detroit Pistons','Central','Eastern' );
insert into TeamInfo values ('GSW','Golden State Warriors','Pacific','Western' );
insert into TeamInfo values ('HOU','Houston Rockets','Southwest','Western' );
insert into TeamInfo values ('IND','Indiana Pacers','Central','Eastern' );
insert into TeamInfo values ('LAC','Los Angeles Clippers','Pacific','Western' );
insert into TeamInfo values ('LAL','Los Angeles Lakers','Pacific','Western' );
insert into TeamInfo values ('MEM','Memphis Grizzlies','Southwest','Western' );
insert into TeamInfo values ('MIA','Miami Heat','Southeast','Eastern' );
insert into TeamInfo values ('MIL','Milwaukee Bucks','Central','Eastern' );
insert into TeamInfo values ('MIN','Minnesota Timberwolves','Northwest','Western' );
insert into TeamInfo values ('NOP','New Orleans Pelicans','Southwest','Western' );
insert into TeamInfo values ('NYK','New York Knicks','Atlantic','Eastern' );
insert into TeamInfo values ('OKC','Oklahoma City Thunder','Northwest','Western' );
insert into TeamInfo values ('ORL','Orlando Magic','Southeast','Eastern' );
insert into TeamInfo values ('PHI','Philadelphia 76ers','Atlantic','Eastern' );
insert into TeamInfo values ('PHX','Phoenix Suns','Pacific','Western' );
insert into TeamInfo values ('POR','Portland Trail Blazers','Northwest','Western' );
insert into TeamInfo values ('SAC','Sacramento Kings','Pacific','Western' );
insert into TeamInfo values ('SAS','San Antonio Spurs','Southwest','Western' );
insert into TeamInfo values ('TOR','Toronto Raptors','Atlantic','Eastern' );
insert into TeamInfo values ('UTA','Utah Jazz','Northwest','Western' );
insert into TeamInfo values ('WAS','Washington Wizards','Southeast','Eastern' );

insert into attendances values ('ATL',654306);
insert into attendances values ('BOS',760690);
insert into attendances values ('BKN',632608);
insert into attendances values ('CHA',710643);
insert into attendances values ('CHI',888882);
insert into attendances values ('CLE',843042);
insert into attendances values ('DAL',811366);
insert into attendances values ('DEN',605585);
insert into attendances values ('DET',655141);
insert into attendances values ('GSW',803436);
insert into attendances values ('HOU',695903);
insert into attendances values ('IND',684578);
insert into attendances values ('LAC',782609);
insert into attendances values ('LAL',776917);
insert into attendances values ('MEM',677314);
insert into attendances values ('MIA',805400);
insert into attendances values ('MIL',648952);
insert into attendances values ('MIN',607203);
insert into attendances values ('NOP',663099);
insert into attendances values ('NYK',810741);
insert into attendances values ('OKC',746323);
insert into attendances values ('ORL',727875);
insert into attendances values ('PHI',710557);
insert into attendances values ('PHX',708639);
insert into attendances values ('POR',792029);
insert into attendances values ('SAC',721928);
insert into attendances values ('SAS',755347);
insert into attendances values ('TOR',813050);
insert into attendances values ('UTA',806605);
insert into attendances values ('WAS',697107);

insert into TeamScore values ('ATL',82,43,39,48.5,103.2,38.1,84.4,8.9,26.1,18.1,24.9,10.3,34.1,23.6,15.8,8.2,4.8,5.2,18.2);
insert into TeamScore values ('BKN',82,20,62,48.2,105.8,37.8,85.2,10.7,31.6,19.4,24.6,8.8,35.1,21.4,16.5,7.2,4.7,5.6,21);
insert into TeamScore values ('BOS',82,53,29,48.2,108,38.6,85.1,12,33.4,18.7,23.2,9.1,32.9,25.2,13.3,7.5,4.1,5.2,20.6);
insert into TeamScore values ('CHA',82,36,46,48.4,104.9,37.7,85.4,10,28.6,19.4,23.8,8.8,34.8,23.1,11.5,7,4.8,5.5,16.6);
insert into TeamScore values ('CHI',82,41,41,48.2,102.9,38.6,87.1,7.6,22.3,18,22.5,12.2,34.1,22.6,13.6,7.8,4.8,4.6,17.7);
insert into TeamScore values ('CLE',82,51,31,48.5,110.3,39.9,84.9,13,33.9,17.5,23.3,9.3,34.4,22.7,13.7,6.6,4,4.3,18.1);
insert into TeamScore values ('DAL',82,33,49,48.2,97.9,36.2,82.3,10.7,30.2,14.8,18.5,7.9,30.7,20.8,11.9,7.5,3.7,3.4,19.1);
insert into TeamScore values ('DEN',82,40,42,48.2,111.7,41.2,87.7,10.6,28.8,18.7,24.2,11.8,34.6,25.3,15,6.9,3.9,4.9,19.1);
insert into TeamScore values ('DET',82,37,45,48.3,101.3,39.9,88.8,7.7,23.4,13.9,19.3,11.1,34.6,21.1,11.9,7,3.8,4.1,17.9);
insert into TeamScore values ('GSW',82,67,15,48.2,115.9,43.1,87.1,12,31.2,17.8,22.6,9.4,35,30.4,14.8,9.6,6.8,3.8,19.3);
insert into TeamScore values ('HOU',82,55,27,48.2,115.3,40.3,87.2,14.4,40.3,20.3,26.5,10.9,33.5,25.2,15.1,8.2,4.3,5,19.9);
insert into TeamScore values ('IND',82,42,40,48.4,105.1,39.3,84.5,8.6,23,17.9,22.1,9,33,22.5,13.8,8.2,5,5,19.5);
insert into TeamScore values ('LAC',82,51,31,48.2,108.7,39.5,83.2,10.3,27.4,19.3,26,9,34,22.5,13,7.5,4.2,3.1,19.8);
insert into TeamScore values ('LAL',82,26,56,48.1,104.6,39.3,87.4,8.9,25.7,17,22.6,11.4,32.1,20.9,15.2,8.2,3.9,5.4,20.7);
insert into TeamScore values ('MEM',82,43,39,48.5,100.5,36.4,83.6,9.4,26.5,18.3,23.4,10.8,32,21.3,12.9,8,4.2,5,22.4);
insert into TeamScore values ('MIA',82,41,41,48.2,103.2,39,85.8,9.9,27,15.2,21.6,10.6,33,21.2,13.4,7.2,5.7,4.9,20.5);
insert into TeamScore values ('MIL',82,42,40,48.2,103.6,38.8,81.9,8.8,23.7,17.2,22.4,8.8,31.6,24.2,14,8.1,5.3,4.6,20.2);
insert into TeamScore values ('MIN',82,31,51,48.3,105.6,39.5,84.4,7.3,21,19.3,24.2,11.4,31,23.7,14,8,4.5,5,20.1);
insert into TeamScore values ('NOP',82,34,48,48.5,104.3,39.1,87,9.4,26.8,16.7,22.3,8.6,35.1,22.8,12.9,7.8,5.5,4.2,18.2);
insert into TeamScore values ('NYK',82,31,51,48.4,104.3,39.6,88.5,8.6,24.7,16.6,21.1,12,33.2,21.8,13.9,7.1,5.5,4.6,20.3);
insert into TeamScore values ('OKC',82,47,35,48.3,106.6,39.5,87.4,8.4,25.8,19.2,25.8,12.2,34.4,21,15,7.9,5,5.5,20.9);
insert into TeamScore values ('ORL',82,29,53,48.3,101.1,38.3,87,8.5,26.1,16,21.4,9.8,33.3,22.2,13.3,7.1,4.8,5.1,19.3);
insert into TeamScore values ('PHI',82,28,54,48.4,102.4,37.7,85.3,10.1,29.8,17,22,9.8,33,23.8,16.7,8.4,5.1,5.4,21.9);
insert into TeamScore values ('PHX',82,24,58,48.4,107.7,39.9,88.5,7.5,22.6,20.4,26.3,11.9,33.1,19.6,15.4,8.2,4.9,5.3,24.8);
insert into TeamScore values ('POR',82,41,41,48.6,107.9,39.5,86.1,10.4,27.7,18.5,23.7,10.1,33.5,21.1,13.7,7,5,5.3,21.2);
insert into TeamScore values ('SAC',82,32,50,48.5,102.8,37.9,82.1,9,23.9,18.1,23.3,8.7,32.3,22.5,14.6,7.6,4,5.1,20.3);
insert into TeamScore values ('SAS',82,61,21,48.3,105.3,39.3,83.7,9.2,23.5,17.6,22,10,33.9,23.8,13.4,8,5.9,4.1,18.3);
insert into TeamScore values ('TOR',82,51,31,48.2,106.9,39.2,84.4,8.8,24.3,19.7,24.7,10.6,32.6,18.5,12.7,8.3,4.9,4.8,20.8);
insert into TeamScore values ('UTA',82,51,31,48.2,100.7,37,79.5,9.6,26,17.1,22.9,9.4,33.8,20.1,13.6,6.7,5,3.8,18.8);
insert into TeamScore values ('WAS',82,49,33,48.4,109.2,41.3,87,9.2,24.8,17.3,22.1,10.3,32.6,23.9,14.2,8.5,4.1,4.6,21.3);

insert into coachinfo values ('Mike','Budenholzer','ATL',2013,328,189,139);
insert into CoachInfo values ('Kenny','Atkinson','BKN',2016,82,20,62);
insert into CoachInfo values ('Brad','Stevens','BOS',2013,328,166,162);
insert into CoachInfo values ('Steve','Clifford','CHA',2013,328,160,168);
insert into CoachInfo values ('Fred','Hoiberg','CHI',2015,164,83,81);
insert into CoachInfo values ('Tyronn','Lue','CLE',2016,123,78,45);
insert into CoachInfo values ('Rick','Carlisle','DAL',2008,722,413,309);
insert into CoachInfo values ('Michael','Malone','DEN',2015,164,73,91);
insert into CoachInfo values ('Stan','Gundy','DET',2014,246,113,133);
insert into CoachInfo values ('Steve','Kerr','GSW',2014,246,207,39);
insert into CoachInfo values ('Mike','Antoni','HOU',2016,82,55,27);
insert into CoachInfo values ('Nate','McMillan','IND',2016,82,42,40);
insert into CoachInfo values ('Doc','Rivers','LAC',2013,328,217,111);
insert into CoachInfo values ('Luke','Walton','LAL',2016,82,26,56);
insert into CoachInfo values ('David','Fizdale','MEM',2016,82,43,39);
insert into CoachInfo values ('Erik','Spoelstra','MIA',2008,722,440,282);
insert into CoachInfo values ('Jason','Kidd','MIL',2014,246,116,130);
insert into CoachInfo values ('Tom','Thibodeau','MIN',2016,82,31,51);
insert into CoachInfo values ('Alvin','Gentry','NOP',2015,164,64,100);
insert into CoachInfo values ('Jeff','Hornacek','NYK',2016,82,31,51);
insert into CoachInfo values ('Billy','Donovan','OKC',2015,164,102,62);
insert into CoachInfo values ('Frank','Vogel','ORL',2016,82,29,53);
insert into CoachInfo values ('Brett','Brown','PHI',2013,328,75,253);
insert into CoachInfo values ('Earl','Watson','PHX',2016,115,33,82);
insert into CoachInfo values ('Terry','Stotts','POR',2012,410,223,187);
insert into CoachInfo values ('Dave','Joerger','SAC',2016,82,32,50);
insert into CoachInfo values ('Gregg','Popovich','SAS',1996,1656,1150,506);
insert into CoachInfo values ('Dwane','Casey','TOR',2011,394,210,184);
insert into CoachInfo values ('Quin','Snyder','UTA',2014,246,129,117);
insert into CoachInfo values ('Scott','Brooks','WAS',2016,82,49,33);

insert into PlayerInfo values ('AJ','Hammons','DAL',22,7.4,2.2,0.8,1.9,0.2,0.5,0.4,0.9,0.4,1.3,0.2,0.5,0,0.6,1);
insert into PlayerInfo values ('Aaron','Brooks','IND',64,13.6,5,1.9,4.6,0.7,2,0.5,0.6,0.3,0.8,1.9,1,0.4,0.1,1.4);
insert into PlayerInfo values ('Aaron','Gordon','ORL',80,28.9,12.7,4.9,10.8,1,3.3,2,2.7,1.5,3.6,1.9,1.1,0.8,0.5,2.2);
insert into PlayerInfo values ('Aaron','Harrison','CHA',5,3.3,0.2,0,0.8,0,0.4,0.2,0.4,0,0.6,0.6,0,0,0,0.4);
insert into PlayerInfo values ('Adreian','Payne','MIN',18,7.5,3.5,1.3,3,0.2,0.8,0.8,1.1,0.5,1.3,0.4,0.4,0.4,0.4,1.8);
insert into PlayerInfo values ('Al','Horford','BOS',68,32.3,14,5.6,11.8,1.3,3.6,1.6,2,1.4,5.4,5,1.7,0.8,1.3,2);
insert into PlayerInfo values ('Al','Jefferson','IND',65,14.2,8.1,3.6,7.1,0,0,1,1.3,1.1,3.1,0.9,0.5,0.3,0.2,1.9);
insert into PlayerInfo values ('Al-Farouq','Aminu','POR',61,29.1,8.7,3,7.6,1.1,3.5,1.6,2.2,1.3,6.1,1.6,1.5,1,0.7,1.7);
insert into PlayerInfo values ('Alan','Anderson','LAC',30,10.3,2.9,1,2.7,0.5,1.5,0.4,0.5,0.1,0.7,0.4,0.2,0.1,0,1.2);
insert into PlayerInfo values ('Alan','Williams','PHX',47,15.1,7.4,2.9,5.7,0,0,1.5,2.4,2,4.2,0.5,0.8,0.6,0.7,2.7);
insert into PlayerInfo values ('Alec','Burks','UTA',42,15.5,6.7,2.4,5.9,0.6,1.8,1.4,1.9,0.4,2.5,0.7,0.8,0.4,0.1,1.2);
insert into PlayerInfo values ('Alex','Abrines','OKC',68,15.5,6,2,5,1.4,3.6,0.6,0.7,0.3,1,0.6,0.5,0.5,0.1,1.7);
insert into PlayerInfo values ('Alex','Len','PHX',75,20.4,8,3,6,0,0.2,1.9,2.7,2,4.6,0.6,1.3,0.5,1.3,3.1);
insert into PlayerInfo values ('Alex','Poythress','PHI',6,26.1,10.7,4.2,9,1,3.2,1.3,1.7,1.8,3,0.8,0.5,0.5,0.3,2.3);
insert into PlayerInfo values ('Alexis','Ajinca','NOP',39,15,5.3,2.3,4.6,0,0.1,0.7,1,1.2,3.4,0.3,0.8,0.5,0.6,2);
insert into PlayerInfo values ('Allen','Crabbe','POR',79,28.5,10.7,3.8,8.2,1.7,3.8,1.3,1.6,0.2,2.6,1.2,0.8,0.7,0.3,2.2);
insert into PlayerInfo values ('Alonzo','Gee','DEN',13,6.9,0.8,0.2,1.1,0,0.2,0.4,0.7,0.3,0.8,0.5,0.3,0.4,0.1,1.1);
insert into PlayerInfo values ('Amir','Johnson','BOS',80,20.1,6.5,2.7,4.6,0.3,0.8,0.8,1.3,1.5,3.1,1.8,1,0.6,0.8,2.6);
insert into PlayerInfo values ('Anderson','Varejao','GSW',14,6.6,1.3,0.4,1,0,0,0.6,0.8,0.9,1.1,0.7,0.6,0.2,0.2,1.1);
insert into PlayerInfo values ('Andre','Drummond','DET',81,30.1,13.6,6,11.2,0,0.1,1.7,4.4,4.3,9.5,1.1,1.9,1.5,1.1,2.9);
insert into PlayerInfo values ('Andre','Iguodala','GSW',76,26.3,7.6,2.9,5.5,0.8,2.3,0.9,1.3,0.7,3.3,3.4,0.8,1,0.5,1.3);
insert into PlayerInfo values ('Andre','Roberson','OKC',79,30.1,6.6,2.7,5.9,0.6,2.3,0.6,1.4,1.2,3.9,1,0.6,1.2,1,2.6);
insert into PlayerInfo values ('Andrew','Bogut','CLE',27,21.6,2.9,1.4,3,0,0,0.1,0.4,2.1,6,1.8,1.6,0.5,0.9,3.2);
insert into PlayerInfo values ('Andrew','Harrison','MEM',72,20.5,5.9,1.6,5,0.6,2.2,2.1,2.7,0.3,1.6,2.8,1.2,0.7,0.3,2.7);
insert into PlayerInfo values ('Andrew','Nicholson','BKN',38,9,2.6,1.1,2.9,0.1,0.7,0.2,0.4,0.4,1.2,0.3,0.4,0.4,0.2,1.4);
insert into PlayerInfo values ('Andrew','Wiggins','MIN',82,37.2,23.6,8.6,19.1,1.3,3.5,5,6.6,1.2,2.8,2.3,1,0.4,2.3,16.9);
insert into PlayerInfo values ('Anthony','Bennett','BKN',22,11,5,1.7,4,0.6,2.1,1.1,1.6,1.1,2.3,0.5,0.5,0.2,0.1,0.8);
insert into PlayerInfo values ('Anthony','Brown','ORL',11,14.5,3.9,1.6,4.5,0.6,2.5,0,0,0.7,2.3,0.7,0.5,0.5,0.1,1.4);
insert into PlayerInfo values ('Anthony','Davis','NOP',75,36.1,28,10.3,20.3,0.5,1.8,6.9,8.6,2.3,9.5,2.1,2.4,1.3,2.2,2.2);
insert into PlayerInfo values ('Anthony','Morrow','CHI',49,14.6,5.5,2,5.1,0.8,2.7,0.7,0.8,0.2,0.4,0.5,0.1,0.5,0,0.9);
insert into PlayerInfo values ('Anthony','Tolliver','SAC',65,22.7,7.1,2.4,5.4,1.4,3.5,0.9,1.3,0.8,2.9,1.2,0.9,0.5,0.3,1.7);
insert into PlayerInfo values ('Archie','Goodwin','BKN',15,14.3,7.3,2.4,4.4,0.3,1,2.2,2.8,0.5,1.4,1.6,0.9,0.3,0.3,0.5);
insert into PlayerInfo values ('Arinze','Onuaku','ORL',8,3.5,0.5,0.3,0.5,0,0,0,0,0.3,0.5,0.3,0.3,0,0.1,0.4);
insert into PlayerInfo values ('Aron','Baynes','DET',75,15.5,4.9,1.9,3.7,0,0,1.1,1.3,1.5,3,0.4,0.7,0.2,0.5,2.2);
insert into PlayerInfo values ('Arron','Afflalo','SAC',61,25.9,8.4,3,6.9,1,2.5,1.4,1.5,0.1,1.9,1.3,0.7,0.3,0.1,1.7);
insert into PlayerInfo values ('Austin','Rivers','LAC',74,27.8,12,4.4,9.9,1.5,4,1.8,2.6,0.3,1.9,2.8,1.6,0.6,0.1,2.5);
insert into PlayerInfo values ('Avery','Bradley','BOS',55,33.4,16.3,6.5,14.1,2,5,1.2,1.7,1.2,4.9,2.2,1.6,1.2,0.2,2.6);
insert into PlayerInfo values ('Axel','Toupane','NOP',4,11.9,2.8,1.3,2.3,0.3,1,0,0,0,0.3,0,0,0.3,0.3,1.5);
insert into PlayerInfo values ('Ben','Bentil','DAL',3,3.3,0,0,1,0,0.3,0,0,0,0.7,0,0.3,0,0,0.3);
insert into PlayerInfo values ('Ben','McLemore','SAC',61,19.3,8.1,3,6.9,1.1,2.8,1.1,1.5,0.3,1.8,0.8,1,0.5,0.1,1.8);
insert into PlayerInfo values ('Beno','Udrih','DET',39,14.4,5.8,2.4,5.1,0.3,0.8,0.8,0.9,0.2,1.3,3.4,0.9,0.3,0,0.7);
insert into PlayerInfo values ('Bismack','Biyombo','ORL',81,22.1,6,2.2,4.2,0,0,1.5,2.9,1.9,5.1,0.9,1.2,0.3,1.1,2.5);
insert into PlayerInfo values ('Blake','Griffin','LAC',61,34,21.6,7.9,15.9,0.6,1.9,5.2,6.9,1.8,6.3,4.9,2.3,0.9,0.4,2.6);
insert into PlayerInfo values ('Boban','Marjanovic','DET',35,8.4,5.5,2.1,3.8,0,0,1.3,1.7,1.3,2.4,0.3,0.3,0.2,0.3,0.7);
insert into PlayerInfo values ('Bobby','Brown','HOU',25,4.9,2.5,0.9,2.4,0.6,1.4,0.1,0.1,0,0.2,0.6,0.2,0,0,0.2);
insert into PlayerInfo values ('Bobby','Portis','CHI',64,15.6,6.8,2.9,5.9,0.5,1.5,0.6,0.9,1.2,3.5,0.5,0.6,0.3,0.2,1.5);
insert into PlayerInfo values ('Bojan','Bogdanovic','WAS',80,25.8,13.7,4.6,10.4,1.8,4.8,2.7,3,0.5,3,1.4,1.6,0.4,0.1,1.8);
insert into PlayerInfo values ('Boris','Diaw','UTA',73,17.6,4.6,2,4.5,0.3,1.1,0.4,0.5,0.6,1.5,2.3,1.2,0.2,0.1,1.1);
insert into PlayerInfo values ('Bradley','Beal','WAS',77,34.9,23.1,8.3,17.2,2.9,7.2,3.7,4.4,0.7,2.4,3.5,2,1.1,0.3,2.2);
insert into PlayerInfo values ('Brandan','Wright','MEM',28,16,6.8,3,4.8,0,0,0.8,1.3,1.1,1.7,0.5,0.4,0.4,0.7,1.5);
insert into PlayerInfo values ('Brandon','Bass','LAC',52,11.1,5.6,2.1,3.6,0,0.1,1.5,1.7,0.8,1.7,0.4,0.6,0.3,0.2,0.9);
insert into PlayerInfo values ('Brandon','Ingram','LAL',79,28.9,9.4,3.5,8.7,0.7,2.4,1.7,2.7,0.8,3.2,2.1,1.5,0.6,0.5,2);
insert into PlayerInfo values ('Brandon','Jennings','WAS',81,22.2,7.1,2.4,6.6,1,3.1,1.4,1.9,0.4,2.1,4.9,1.6,0.9,0,1.4);
insert into PlayerInfo values ('Brandon','Knight','PHX',53,21.2,11,3.9,9.7,0.8,2.6,2.4,2.9,0.5,1.7,2.4,1.6,0.5,0.1,1.6);
insert into PlayerInfo values ('Brandon','Rush','MIN',47,21.9,4.2,1.5,4,0.9,2.4,0.3,0.4,0.3,1.8,1,0.6,0.5,0.5,0.9);
insert into PlayerInfo values ('Brian','Roberts','CHA',41,10.2,3.5,1.1,3,0.4,1.1,0.8,1,0.1,0.8,1.3,0.6,0.2,0,0.4);
insert into PlayerInfo values ('Briante','Weber','CHA',20,10.2,3.1,1.3,3,0.1,0.5,0.6,0.8,0.4,0.9,1.1,0.4,0.6,0.1,0.8);
insert into PlayerInfo values ('Brice','Johnson','LAC',3,3.1,1.3,0.7,2.3,0,0,0,0,0.3,0.7,0.3,0.3,0.7,0.3,0);
insert into PlayerInfo values ('Brook','Lopez','BKN',75,29.6,20.5,7.4,15.6,1.8,5.2,3.9,4.9,1.6,3.8,2.3,2.5,0.5,1.7,2.6);
insert into PlayerInfo values ('Bruno','Caboclo','TOR',8,4.8,1.6,0.7,1.8,0.2,0.7,0,0,0.6,0.6,0.4,0.2,0.2,0.1,0.4);
insert into PlayerInfo values ('Bryn','Forbes','SAS',35,8,2.6,1,2.8,0.5,1.5,0.1,0.2,0.1,0.6,0.6,0.3,0,0,0.6);
insert into PlayerInfo values ('Buddy','Hield','SAC',82,23,10.6,4,9.4,1.8,4.6,0.8,0.9,0.4,2.9,1.5,1.2,0.5,0.1,1.4);
insert into PlayerInfo values ('C.J.','Watson','ORL',62,16.6,4.5,1.5,4,0.5,1.7,0.9,1.1,0.3,1.2,1.8,0.8,0.7,0,1.4);
insert into PlayerInfo values ('CJ','McCollum','POR',80,34.9,23,8.7,18,2.3,5.5,3.4,3.7,0.8,2.9,3.6,2.2,0.9,0.5,2.5);
insert into PlayerInfo values ('CJ','Miles','IND',75,23.4,10.7,3.7,8.5,2.2,5.4,1.1,1.2,0.4,2.6,0.6,0.5,0.6,0.3,2);
insert into PlayerInfo values ('CJ','Wilcox','ORL',22,4.9,1,0.4,1.4,0.1,0.7,0.1,0.1,0.2,0.4,0.5,0.3,0.1,0,0.4);
insert into PlayerInfo values ('Cameron','Payne','CHI',31,14.9,5.2,2.1,6.2,0.9,2.8,0.2,0.3,0.1,1.5,1.8,0.9,0.5,0.1,1.7);
insert into PlayerInfo values ('Caris','LeVert','BKN',56,21.8,8.2,3,6.7,1,3.2,1.2,1.6,0.4,2.9,1.9,1,0.9,0.1,1.6);
insert into PlayerInfo values ('Carmelo','Anthony','NYK',74,34.3,22.4,8.1,18.8,2,5.7,4.1,4.9,0.8,5.1,2.9,2.1,0.8,0.5,2.7);
insert into PlayerInfo values ('Chandler','Parsons','MEM',34,19.8,6.2,2.2,6.5,0.7,2.7,1,1.3,0.2,2.3,1.6,0.7,0.6,0.1,1.5);
insert into PlayerInfo values ('Channing','Frye','CLE',74,18.9,9.1,3.2,7,1.9,4.5,0.9,1,0.5,3.4,0.6,0.7,0.4,0.5,1.9);
insert into PlayerInfo values ('Chasson','Randle','NYK',26,11.5,5.3,1.5,3.8,0.6,1.8,1.6,1.7,0.2,1,1.3,0.7,0.3,0.1,1.5);
insert into PlayerInfo values ('Cheick','Diallo','NOP',17,11.7,5.1,2.1,4.5,0,0,0.9,1.2,1.4,2.9,0.2,0.4,0.2,0.4,1);
insert into PlayerInfo values ('Chinanu','Onuaku','HOU',5,10.3,2.8,1,1.4,0,0,0.8,0.8,0.4,1.6,0.6,0.8,0.6,0.2,1.2);
insert into PlayerInfo values ('Chris','Andersen','CLE',12,9.5,2.3,0.8,1.8,0,0.3,0.8,1.2,0.8,1.8,0.4,0.4,0.4,0.6,1.7);
insert into PlayerInfo values ('Chris','McCullough','WAS',16,5,2.3,1,2,0.1,0.4,0.2,0.3,0.6,0.6,0.1,0.2,0.1,0.1,0.4);
insert into PlayerInfo values ('Chris','Paul','LAC',61,31.5,18.1,6.1,12.9,2,5,3.8,4.3,0.7,4.3,9.2,2.4,2,0.1,2.4);
insert into PlayerInfo values ('Christian','Wood','CHA',13,8.2,2.7,0.9,1.8,0,0.4,0.8,1.2,1.1,1.2,0.2,0.5,0.2,0.5,0.8);
insert into PlayerInfo values ('Clint','Capela','HOU',65,23.9,12.6,5.6,8.7,0,0,1.4,2.7,2.7,5.4,1,1.3,0.5,1.2,2.8);
insert into PlayerInfo values ('Cody','Zeller','CHA',62,27.8,10.3,4.1,7.1,0,0,2.1,3.2,2.2,4.4,1.6,1,1,0.9,3);
insert into PlayerInfo values ('Cole','Aldrich','MIN',62,8.6,1.7,0.7,1.4,0,0,0.2,0.4,0.8,1.7,0.4,0.3,0.4,0.4,1.4);
insert into PlayerInfo values ('Corey','Brewer','LAL',82,15.6,4.5,1.8,4.2,0.3,1.4,0.6,0.8,0.4,1.6,1.2,0.7,0.7,0.2,1.6);
insert into PlayerInfo values ('Cory','Joseph','TOR',79,25,9.3,3.7,8.3,0.6,1.7,1.2,1.5,0.6,2.3,3.3,1.4,0.8,0.2,1.8);
insert into PlayerInfo values ('Courtney','Lee','NYK',77,31.9,10.8,4.2,9.1,1.4,3.5,1.1,1.3,0.7,2.7,2.3,0.9,1.1,0.3,1.8);
insert into PlayerInfo values ('Cristiano','Felicio','CHI',66,15.8,4.8,1.9,3.3,0,0,0.9,1.4,1.9,2.8,0.6,0.5,0.4,0.3,1.7);
insert into PlayerInfo values ('D Angelo','Russell','LAL',63,28.7,15.6,5.6,13.8,2.1,6.1,2.3,3,0.5,3,4.8,2.8,1.4,0.3,2.1);
insert into PlayerInfo values ('D.J.','Augustin','ORL',78,19.7,7.9,2.5,6.6,1.2,3.5,1.7,2.1,0.2,1.3,2.7,1.2,0.4,0,1.3);
insert into PlayerInfo values ('Dahntay','Jones','CLE',1,12,9,3,8,0,2,3,4,1,1,1,1,0,0,1);
insert into PlayerInfo values ('Damian','Jones','GSW',10,8.5,1.9,0.8,1.6,0,0,0.3,1,0.9,1.4,0,0.6,0.1,0.4,1.5);
insert into PlayerInfo values ('Damian','Lillard','POR',75,35.9,27,8.8,19.8,2.9,7.7,6.5,7.3,0.6,4.3,5.9,2.6,0.9,0.3,2);
insert into PlayerInfo values ('Damjan','Rudez','ORL',45,7,1.8,0.7,2,0.4,1.4,0,0,0.1,0.4,0.4,0.2,0.3,0,0.7);
insert into PlayerInfo values ('Daniel','Ochefu','WAS',19,3.9,1.3,0.6,1.4,0,0,0,0.1,0.3,0.9,0.2,0.2,0.1,0,0.9);
insert into PlayerInfo values ('Danilo','Gallinari','DEN',62,33.9,18.2,5.3,11.9,2,5.1,5.5,6.1,0.6,4.5,2.1,1.3,0.6,0.2,1.5);
insert into PlayerInfo values ('Danny','Green','SAS',67,26.8,7.3,2.6,6.6,1.7,4.6,0.4,0.5,0.5,2.8,1.8,1.1,1,0.8,1.8);
insert into PlayerInfo values ('Dante','Cunningham','NOP',66,25,6.6,2.6,5.4,1.1,2.7,0.2,0.4,0.8,3.3,0.6,0.4,0.6,0.4,1.5);
insert into PlayerInfo values ('Dante','Exum','UTA',66,18.6,6.2,2.3,5.5,0.7,2.3,0.9,1.1,0.5,1.5,1.7,1.2,0.3,0.2,2.2);
insert into PlayerInfo values ('Danuel','House','WAS',1,0.8,0,0,0,0,0,0,0,0,1,0,0,0,0,0);
insert into PlayerInfo values ('Dario','Saric','PHI',81,26.3,12.8,4.7,11.4,1.3,4.2,2.1,2.7,1.4,5,2.2,2.3,0.7,0.4,2);
insert into PlayerInfo values ('Darrell','Arthur','DEN',41,15.6,6.4,2.3,5.2,1.3,2.9,0.5,0.5,0.6,2.1,1,0.9,0.5,0.5,1.9);
insert into PlayerInfo values ('Darren','Collison','SAC',68,30.3,13.2,5,10.5,1.1,2.6,2.2,2.5,0.3,1.9,4.6,1.7,1,0.1,1.8);
insert into PlayerInfo values ('Darrun','Hilliard','DET',39,9.8,3.3,1.2,3.2,0.3,1.2,0.5,0.7,0.1,0.8,0.8,0.7,0.3,0.1,1);
insert into PlayerInfo values ('David','Lee','SAS',78,18.8,7.3,3.1,5.3,0,0,1,1.4,1.9,3.7,1.6,1,0.4,0.5,1.6);
insert into PlayerInfo values ('David','Nwaba','LAL',20,19.9,6,2.4,4.1,0.1,0.3,1.3,2,0.9,2.3,0.7,0.6,0.7,0.4,1.8);
insert into PlayerInfo values ('David','West','GSW',68,12.6,4.6,2,3.7,0,0.1,0.6,0.8,0.7,2.3,2.2,1.1,0.6,0.7,1.5);
insert into PlayerInfo values ('Davis','Bertans','SAS',66,12.2,4.5,1.5,3.5,1,2.6,0.4,0.5,0.3,1.1,0.7,0.5,0.3,0.4,1.1);
insert into PlayerInfo values ('DeAndre','Jordan','LAC',81,31.7,12.7,5.1,7.1,0,0,2.5,5.2,3.7,10.1,1.2,1.4,0.6,1.7,2.6);
insert into PlayerInfo values ('DeAndre','Liggins','DAL',62,12.5,2.5,0.9,2.3,0.3,0.7,0.4,0.6,0.3,1.4,0.9,0.7,0.8,0.2,1.3);
insert into PlayerInfo values ('DeAndre','Bembry','ATL',38,9.8,2.7,1.2,2.6,0,0.5,0.2,0.4,0.4,1.2,0.7,0.4,0.2,0.1,0.6);
insert into PlayerInfo values ('DeMar','DeRozan','TOR',73,35.5,27.3,9.7,20.9,0.4,1.7,7.4,8.7,0.9,4.3,3.9,2.4,1.1,0.2,1.8);
insert into PlayerInfo values ('DeMarcus','Cousins','NOP',72,34.2,27,9,19.9,1.8,5,7.2,9.3,2.1,8.9,4.6,3.7,1.4,1.3,3.9);
insert into PlayerInfo values ('DeMarre','Carroll','TOR',71,26.2,8.9,3.1,7.6,1.5,4.4,1.2,1.6,0.9,2.9,1,0.8,1.1,0.4,2);
insert into PlayerInfo values ('Dejounte','Murray','SAS',38,8.5,3.4,1.3,3.1,0.2,0.6,0.6,0.8,0.2,0.9,1.3,1,0.2,0.2,0.8);
insert into PlayerInfo values ('Delon','Wright','TOR',27,16.5,5.6,1.8,4.3,0.4,1.1,1.6,2,0.6,1.2,2.1,0.9,1,0.4,1.1);
insert into PlayerInfo values ('Demetrius','Jackson','BOS',5,3.4,2,0.6,0.8,0.2,0.2,0.6,1.2,0.4,0.4,0.6,0,0,0,0);
insert into PlayerInfo values ('Dennis','Schroder','ATL',79,31.5,17.9,6.9,15.4,1.3,3.7,2.8,3.2,0.5,2.6,6.3,3.3,0.9,0.2,1.9);
insert into PlayerInfo values ('Denzel','Valentine','CHI',57,17.1,5.1,1.8,5.1,1.3,3.6,0.2,0.3,0.2,2.5,1.1,0.9,0.5,0.1,1.5);
insert into PlayerInfo values ('Deron','Williams','CLE',63,26.2,11,4.1,9.4,1.3,3.7,1.4,1.7,0.2,2.1,5.6,2.2,0.5,0.1,2.2);
insert into PlayerInfo values ('Derrick','Favors','UTA',60,23.7,9.5,4.1,8.3,0.1,0.2,1.3,2.2,1.8,4.3,1.1,1.2,0.9,0.8,2.1);
insert into PlayerInfo values ('Derrick','Jones Jr.','PHX',32,17,5.3,2.1,3.8,0.1,0.3,0.9,1.3,1.2,1.3,0.4,0.4,0.4,0.4,2);
insert into PlayerInfo values ('Derrick','Rose','NYK',64,32.5,18,7.2,15.3,0.2,0.9,3.5,4,1,2.8,4.4,2.3,0.7,0.3,1.3);
insert into PlayerInfo values ('Derrick','Williams','CLE',50,16.1,6.1,2.2,4.9,0.6,1.9,1.2,1.8,0.4,2.2,0.6,0.6,0.3,0.1,1.2);
insert into PlayerInfo values ('Devin','Booker','PHX',76,35,22.1,7.8,18.3,1.9,5.2,4.7,5.7,0.6,2.6,3.4,3.1,0.9,0.3,3.1);
insert into PlayerInfo values ('Devin','Harris','DAL',64,16.7,6.7,2.1,5.2,0.9,2.7,1.6,2,0.2,1.8,2.1,0.9,0.7,0.1,1.6);
insert into PlayerInfo values ('Dewayne','Dedmon','SAS',75,17.7,5.1,2.1,3.4,0,0,0.9,1.2,1.7,4.8,0.6,0.8,0.5,0.8,2.4);
insert into PlayerInfo values ('Deyonta','Davis','MEM',36,6.6,1.6,0.7,1.3,0,0,0.3,0.5,0.6,1.1,0.1,0.2,0.1,0.5,1.1);
insert into PlayerInfo values ('Diamond','Stone','LAC',7,3.5,1.4,0.4,1.9,0,0,0.6,0.6,0.1,0.7,0,0.3,0,0.1,0.7);
insert into PlayerInfo values ('Dion','Waiters','MIA',46,30.1,15.8,6.1,14.4,1.8,4.7,1.8,2.8,0.4,2.9,4.3,2.2,0.9,0.4,2.1);
insert into PlayerInfo values ('Dirk','Nowitzki','DAL',53,26.8,14.2,5.5,12.6,1.5,3.9,1.8,2.1,0.4,6.1,1.5,0.9,0.6,0.7,2.1);
insert into PlayerInfo values ('Domantas','Sabonis','OKC',81,20.1,5.9,2.4,5.9,0.6,2,0.5,0.8,0.6,3,1,1,0.5,0.4,2.5);
insert into PlayerInfo values ('Donatas','Motiejunas','NOP',34,14.1,4.4,1.7,4.1,0.3,1.4,0.7,1.4,0.8,2.2,0.9,0.9,0.5,0.3,1.6);
insert into PlayerInfo values ('Dorian','Finney-Smith','DAL',80,20.4,4.3,1.5,4.1,0.7,2.4,0.6,0.8,0.7,2.1,0.8,0.6,0.6,0.3,1.5);
insert into PlayerInfo values ('Doug','McDermott','OKC',66,22.8,9,3.4,7.5,1.2,3.2,1.1,1.3,0.3,2.4,0.9,0.6,0.2,0.1,1.2);
insert into PlayerInfo values ('Dragan','Bender','PHX',41,13.3,3.4,1.3,3.7,0.7,2.3,0.1,0.3,0.5,1.9,0.5,0.7,0.2,0.5,1.7);
insert into PlayerInfo values ('Draymond','Green','GSW',76,32.5,10.2,3.6,8.6,1.1,3.5,2,2.8,1.3,6.6,7,2.4,2,1.4,2.9);
insert into PlayerInfo values ('Dwight','Howard','ATL',74,29.7,13.5,5.2,8.3,0,0,3.1,5.7,4,8.7,1.4,2.3,0.9,1.2,2.7);
insert into PlayerInfo values ('Dwight','Powell','DAL',76,17.3,6.7,2.5,4.9,0.3,1,1.4,1.8,1.2,2.8,0.6,0.4,0.8,0.5,1.8);
insert into PlayerInfo values ('Dwyane','Wade','CHI',60,29.9,18.3,6.9,15.9,0.8,2.4,3.7,4.7,1.1,3.5,3.8,2.3,1.4,0.7,1.9);
insert into PlayerInfo values ('E Twaun','Moore','NOP',73,24.9,9.6,3.9,8.5,1.1,2.8,0.8,1,0.5,1.6,2.2,0.8,0.7,0.4,1.8);
insert into PlayerInfo values ('Ed','Davis','POR',46,17.2,4.3,1.6,3.1,0,0,1.1,1.8,2.1,3.2,0.6,0.8,0.3,0.5,3);
insert into PlayerInfo values ('Edy','Tavares','CLE',2,13.8,4,2,2.5,0,0,0,1.5,2,3.5,0.5,1,0,3,1.5);
insert into PlayerInfo values ('Elfrid','Payton','ORL',82,29.4,12.8,5.2,11.1,0.5,1.8,1.8,2.6,1.1,3.6,6.5,2.2,1.1,0.5,2.2);
insert into PlayerInfo values ('Elijah','Millsap','PHX',2,11.6,1.5,0.5,3.5,0,1,0.5,1,1.5,1.5,0.5,1,0,0,1);
insert into PlayerInfo values ('Emmanuel','Mudiay','DEN',54,25.6,11,3.8,10,1,3.2,2.4,3,0.5,2.7,3.9,2.2,0.7,0.2,1.7);
insert into PlayerInfo values ('Enes','Kanter','OKC',72,21.3,14.3,5.6,10.2,0.1,0.5,3.1,4,2.7,4,0.9,1.7,0.4,0.5,2.1);
insert into PlayerInfo values ('Eric','Bledsoe','PHX',64,33,21.1,6.8,15.7,1.6,4.7,5.9,6.9,0.8,4.1,6.3,3.4,1.4,0.5,2.5);
insert into PlayerInfo values ('Eric','Gordon','HOU',75,31,16.2,5.5,13.5,3.3,8.8,2,2.3,0.4,2.3,2.5,1.6,0.6,0.5,2);
insert into PlayerInfo values ('Ersan','Ilyasova','ATL',82,26.1,13.1,4.7,10.9,1.7,4.9,2,2.5,1.4,4.5,1.7,1.4,0.7,0.3,2.6);
insert into PlayerInfo values ('Evan','Fournier','ORL',68,33.1,17.2,6,13.7,1.9,5.3,3.3,4.1,0.6,2.4,3,2.1,1,0.1,2.6);
insert into PlayerInfo values ('Evan','Turner','POR',65,25.5,9,3.6,8.5,0.5,1.8,1.3,1.6,0.6,3.2,3.2,1.5,0.8,0.4,1.9);
insert into PlayerInfo values ('Frank','Kaminsky','CHA',75,26.1,11.7,4.3,10.7,1.5,4.7,1.6,2.1,0.8,3.7,2.2,1,0.6,0.5,1.9);
insert into PlayerInfo values ('Fred','VanVleet','TOR',36,8.1,2.9,1.1,3,0.3,0.8,0.5,0.6,0.1,1,0.9,0.4,0.4,0.1,1);
insert into PlayerInfo values ('Garrett','Temple','SAC',65,26.6,7.8,2.8,6.6,1.3,3.4,0.9,1.1,0.5,2.3,2.6,1.2,1.3,0.4,2.2);
insert into PlayerInfo values ('Gary','Harris','DEN',56,31.2,14.9,5.6,11.2,1.9,4.5,1.8,2.4,0.8,2.3,2.9,1.3,1.2,0.1,1.6);
insert into PlayerInfo values ('Gary','Neal','ATL',2,9.2,2,0,3.5,0,1,2,2,0,0.5,0.5,0,0,0,0.5);
insert into PlayerInfo values ('Gary','Payton II','MIL',6,16.5,3.3,1.3,3.7,0.2,1.5,0.5,0.8,0,2,2.2,1.7,0.5,0.7,1.5);
insert into PlayerInfo values ('George','Hill','UTA',49,31.5,16.9,5.9,12.4,1.9,4.8,3.2,4,0.5,2.9,4.2,1.7,1,0.2,2.3);
insert into PlayerInfo values ('Georges','Niang','IND',22,4.1,0.9,0.4,1.6,0,0.5,0.1,0.1,0.1,0.7,0.2,0.2,0.1,0,0.3);
insert into PlayerInfo values ('Georgios','Papagiannis','SAC',22,16.1,5.6,2.5,4.6,0,0.1,0.5,0.6,1.1,2.8,0.9,1.1,0.1,0.8,2);
insert into PlayerInfo values ('Gerald','Green','BOS',47,11.4,5.6,2,4.9,0.8,2.4,0.7,0.9,0.3,1.4,0.7,0.5,0.2,0.1,1);
insert into PlayerInfo values ('Gerald','Henderson','PHI',72,23.2,9.2,3.3,7.7,0.8,2.4,1.8,2.3,0.5,2.1,1.6,0.9,0.6,0.2,1.8);
insert into PlayerInfo values ('Giannis','Antetokounmpo','MIL',80,35.6,22.9,8.2,15.7,0.6,2.3,5.9,7.7,1.8,7,5.4,2.9,1.6,1.9,3.1);
insert into PlayerInfo values ('Glenn','Robinson III','IND',68,20.6,6.1,2.3,4.9,0.7,1.8,0.8,1.1,0.8,2.7,0.7,0.5,0.6,0.3,0.9);
insert into PlayerInfo values ('Goran','Dragic','MIA',73,33.7,20.3,7.3,15.4,1.6,4,4.1,5.2,0.8,3,5.8,2.9,1.2,0.2,2.7);
insert into PlayerInfo values ('Gordon','Hayward','UTA',73,34.5,21.9,7.5,15.8,2,5.1,5,5.9,0.7,4.7,3.5,1.9,1,0.3,1.6);
insert into PlayerInfo values ('Gorgui','Dieng','MIN',82,32.4,10,4,8.1,0.2,0.5,1.7,2,2.3,5.6,1.9,1.3,1.1,1.2,3.1);
insert into PlayerInfo values ('Greg','Monroe','MIL',81,22.5,11.7,4.8,9,0,0,2.2,3,2.1,4.5,2.3,1.7,1.1,0.5,2.1);
insert into PlayerInfo values ('Greivis','Vasquez','BKN',3,12.9,2.3,0.7,2.7,0.3,1,0.7,1,0,0.7,1.7,0.3,0.3,0.3,2);
insert into PlayerInfo values ('Harrison','Barnes','DAL',78,35.8,19.2,7.6,16.2,1,2.8,3.1,3.6,1.2,3.8,1.5,1.3,0.8,0.2,1.6);
insert into PlayerInfo values ('Hassan','Whiteside','MIA',77,32.6,17,7,12.6,0,0,2.9,4.6,3.8,10.3,0.7,2,0.7,2.1,2.9);
insert into PlayerInfo values ('Henry','Ellenson','DET',19,7.7,3.2,1.2,3.4,0.5,1.8,0.2,0.4,0.4,1.7,0.4,0.7,0.1,0.1,0.3);
insert into PlayerInfo values ('Hollis','Thompson','NOP',40,18.8,5.1,1.9,5,0.8,2.4,0.5,0.7,0.5,2.3,0.9,0.3,0.5,0.2,1.7);
insert into PlayerInfo values ('Ian','Clark','GSW',77,14.8,6.8,2.7,5.6,0.8,2.1,0.6,0.8,0.3,1.3,1.2,0.7,0.5,0.1,1);
insert into PlayerInfo values ('Ian','Mahinmi','WAS',31,17.9,5.6,2.1,3.6,0,0,1.4,2.4,1.5,3.3,0.6,1.1,1.1,0.8,2.9);
insert into PlayerInfo values ('Iman','Shumpert','CLE',76,25.5,7.5,2.6,6.4,1.2,3.4,0.9,1.2,0.5,2.4,1.4,1,0.8,0.4,2);
insert into PlayerInfo values ('Isaiah','Canaan','CHI',39,15.2,4.6,1.6,4.4,0.6,2.4,0.8,0.8,0.2,1.1,0.9,0.5,0.6,0,0.9);
insert into PlayerInfo values ('Isaiah','Taylor','HOU',4,13,0.8,0.3,1.8,0,0.5,0.3,0.5,0.3,0.5,0.8,0,0.3,0.3,1.5);
insert into PlayerInfo values ('Isaiah','Thomas','BOS',76,33.8,28.9,9,19.4,3.2,8.5,7.8,8.5,0.6,2.1,5.9,2.8,0.9,0.2,2.2);
insert into PlayerInfo values ('Isaiah','Whitehead','BKN',73,22.5,7.4,2.8,7,0.6,2,1.2,1.5,0.4,2.1,2.6,1.9,0.6,0.5,2.4);
insert into PlayerInfo values ('Ish','Smith','DET',81,24.1,9.4,4.1,9.2,0.3,1.3,0.9,1.3,0.3,2.6,5.2,1.4,0.8,0.4,1.6);
insert into PlayerInfo values ('Ivica','Zubac','LAL',38,16,7.5,3.3,6.3,0,0.1,0.8,1.3,1.1,3.1,0.8,0.8,0.4,0.9,1.7);
insert into PlayerInfo values ('J.J.','Barea','DAL',34,22.1,10.9,4.1,9.8,1.5,4.2,1.3,1.5,0.3,2.1,5.5,1.8,0.4,0,0.9);
insert into PlayerInfo values ('JJ','Redick','LAC',78,28.2,15,5.1,11.4,2.6,6,2.3,2.6,0.1,2.1,1.4,1.3,0.7,0.2,1.6);
insert into PlayerInfo values ('JR','Smith','CLE',41,29,8.6,3,8.7,2.3,6.6,0.2,0.4,0.4,2.3,1.5,0.6,1,0.3,1.9);
insert into PlayerInfo values ('JaMychal','Green','MEM',77,27.3,8.9,3.2,6.5,0.7,1.9,1.7,2.2,2.2,4.9,1.1,1.2,0.6,0.4,3.2);
insert into PlayerInfo values ('JaVale','McGee','GSW',77,9.6,6.1,2.7,4.1,0,0,0.7,1.4,1.3,1.9,0.2,0.5,0.2,0.9,1.4);
insert into PlayerInfo values ('Jabari','Parker','MIL',51,33.9,20.1,7.8,16,1.3,3.5,3.2,4.3,1.5,4.6,2.8,1.8,1,0.4,2.2);
insert into PlayerInfo values ('Jae','Crowder','BOS',72,32.4,13.9,4.6,10,2.2,5.5,2.4,3,0.7,5.1,2.2,1.1,1,0.3,2.2);
insert into PlayerInfo values ('Jahlil','Okafor','PHI',50,22.7,11.8,4.8,9.4,0,0,2.1,3.2,1.6,3.2,1.2,1.8,0.4,1,2.4);
insert into PlayerInfo values ('Jake','Layman','POR',35,7.1,2.2,0.7,2.5,0.4,1.5,0.4,0.5,0.2,0.5,0.3,0.3,0.3,0.1,0.6);
insert into PlayerInfo values ('Jakob','Poeltl','TOR',53,11.7,3.1,1.2,2.1,0,0,0.6,1.1,1.4,1.6,0.2,0.5,0.3,0.4,2.1);
insert into PlayerInfo values ('Jamal','Crawford','LAC',82,26.3,12.3,4.4,10.6,1.4,3.9,2.1,2.5,0.2,1.4,2.6,1.6,0.7,0.2,1.4);
insert into PlayerInfo values ('Jamal','Murray','DEN',81,21.6,9.9,3.6,8.9,1.4,4.2,1.3,1.5,0.5,2.1,2.1,1.4,0.6,0.3,1.5);
insert into PlayerInfo values ('Jameer','Nelson','DEN',74,27.3,9.2,3.6,8.1,1.4,3.6,0.6,0.8,0.4,2.2,5.1,1.7,0.7,0.1,2.6);
insert into PlayerInfo values ('James','Ennis III','MEM',64,23.4,6.7,2.3,5,0.8,2.1,1.3,1.7,1.1,3,1,0.9,0.7,0.3,2.6);
insert into PlayerInfo values ('James','Harden','HOU',81,36.4,29.1,8.3,18.9,3.2,9.3,9.2,10.9,1.2,7,11.2,5.7,1.5,0.5,2.7);
insert into PlayerInfo values ('James','Johnson','MIA',76,27.4,12.8,4.8,10.1,1.1,3.4,2,2.8,0.9,4.1,3.6,2.3,1,1.1,2.6);
insert into PlayerInfo values ('James','Jones','CLE',48,7.9,2.8,0.9,1.9,0.6,1.4,0.3,0.4,0.1,0.7,0.3,0.2,0.1,0.2,0.8);
insert into PlayerInfo values ('James','McAdoo','GSW',52,8.8,2.8,1.2,2.3,0,0.2,0.4,0.8,0.7,1.1,0.3,0.4,0.3,0.6,0.9);
insert into PlayerInfo values ('James','Young','BOS',29,7.6,2.3,0.9,2,0.4,1.2,0.2,0.3,0.2,0.7,0.1,0.1,0.3,0.1,0.5);
insert into PlayerInfo values ('Jared','Dudley','PHX',64,21.3,6.8,2.5,5.4,1.2,3.2,0.7,1,0.5,3,1.9,1.1,0.7,0.3,2.4);
insert into PlayerInfo values ('Jared','Sullinger','TOR',11,10.7,3.4,1.4,4.3,0.3,1.6,0.4,0.7,0.9,1.5,0.3,0.4,0.4,0.1,1.5);
insert into PlayerInfo values ('Jarell','Eddie','PHX',5,12.5,4.8,1.2,3.8,0.8,3.2,1.6,1.8,0.2,1.2,0,0.2,0.2,0,0.2);
insert into PlayerInfo values ('Jarell','Martin','MEM',42,13.3,3.9,1.4,3.6,0.2,0.6,1,1.2,1,2.9,0.2,0.7,0.4,0.2,2.2);
insert into PlayerInfo values ('Jarnell','Stokes','DEN',2,3.3,1.5,0.5,0.5,0,0,0.5,1,0.5,0.5,1,0,0.5,0,1.5);
insert into PlayerInfo values ('Jarrett','Jack','NOP',2,16.5,3,1,1.5,0,0.5,1,1,0,0,2.5,1.5,1,0,2);
insert into PlayerInfo values ('Jarrod','Uthoff','DAL',9,12.8,4.4,1.8,4.2,0.3,1,0.6,0.8,0.9,1.6,1,0.3,0.2,0.4,0.9);
insert into PlayerInfo values ('Jason','Smith','WAS',74,14.4,5.7,2.4,4.4,0.5,1.1,0.5,0.7,0.9,2.6,0.5,0.8,0.3,0.7,2.3);
insert into PlayerInfo values ('Jason','Terry','MIL',74,18.4,4.1,1.4,3.3,1,2.3,0.3,0.4,0.2,1.2,1.3,0.5,0.6,0.3,1.3);
insert into PlayerInfo values ('Jaylen','Brown','BOS',78,17.2,6.6,2.5,5.4,0.6,1.7,1.1,1.6,0.6,2.2,0.8,0.9,0.4,0.2,1.8);
insert into PlayerInfo values ('Jeff','Green','ORL',69,22.4,9.2,3.2,8.1,0.8,2.8,2.1,2.4,0.6,2.5,1.2,1.1,0.5,0.2,1.5);
insert into PlayerInfo values ('Jeff','Teague','IND',81,32.5,15.3,4.9,11.1,1.1,3.1,4.4,5.1,0.4,3.6,7.8,2.6,1.2,0.4,2);
insert into PlayerInfo values ('Jeff','Withey','UTA',51,8.5,2.9,1.1,2,0,0,0.7,0.9,1,1.4,0.1,0.3,0.3,0.6,1);
insert into PlayerInfo values ('Jerami','Grant','OKC',80,19.1,5.5,1.9,4.1,0.5,1.5,1.1,1.8,0.5,2.1,0.6,0.6,0.4,1,1.9);
insert into PlayerInfo values ('Jeremy','Lamb','CHA',62,18.4,9.7,3.6,7.9,0.7,2.4,1.8,2.1,0.5,3.8,1.2,0.6,0.4,0.4,1.6);
insert into PlayerInfo values ('Jeremy','Lin','BKN',35,24.5,14.5,4.9,11.1,1.6,4.3,3.2,3.9,0.3,3.4,5.1,2.4,1.2,0.4,2.2);
insert into PlayerInfo values ('Jerian','Grant','CHI',63,16.3,5.9,2,4.8,0.8,2.1,1,1.2,0.3,1.5,1.9,0.7,0.7,0.1,1.5);
insert into PlayerInfo values ('Jerryd','Bayless','PHI',3,23.8,11,3.7,10.7,0.7,1.7,3,3.3,1,3,4.3,3,0,0,1.3);
insert into PlayerInfo values ('Jimmy','Butler','CHI',76,37,23.9,7.5,16.5,1.2,3.3,7.7,8.9,1.7,4.5,5.5,2.1,1.9,0.4,1.5);
insert into PlayerInfo values ('Joakim','Noah','NYK',46,22.1,5,2.2,4.4,0,0,0.7,1.7,3.5,5.2,2.2,1.3,0.7,0.8,2.8);
insert into PlayerInfo values ('Jodie','Meeks','ORL',36,20.5,9.1,2.9,7.1,1.6,3.8,1.8,2.1,0.1,2,1.3,1,0.9,0.1,1.1);
insert into PlayerInfo values ('Joe','Harris','BKN',51,21.9,8.2,3,7,1.6,4.3,0.7,0.9,0.3,2.5,1,1.1,0.6,0.2,2.3);
insert into PlayerInfo values ('Joe','Ingles','UTA',82,24.1,7.1,2.5,5.5,1.5,3.4,0.6,0.8,0.3,2.9,2.7,1.3,1.2,0.1,2);
insert into PlayerInfo values ('Joe','Johnson','UTA',78,23.6,9.2,3.5,8,1.4,3.3,0.8,1,0.4,2.7,1.8,0.9,0.5,0.2,1.2);
insert into PlayerInfo values ('Joe','Young','IND',32,4.1,2.1,0.8,2.2,0.2,0.7,0.3,0.5,0,0.5,0.5,0.2,0.1,0,0.2);
insert into PlayerInfo values ('Joel','Anthony','SAS',19,6.4,1.3,0.5,0.8,0,0,0.3,0.4,0.4,1.2,0.2,0.2,0.1,0.3,0.6);
insert into PlayerInfo values ('Joel','Bolomboy','UTA',12,4.4,1.8,0.8,1.3,0.1,0.3,0.3,0.5,0.3,1.1,0.2,0.2,0.1,0.2,0.1);
insert into PlayerInfo values ('Joel','Embiid','PHI',31,25.4,20.2,6.5,13.8,1.2,3.2,6.2,7.9,2,5.9,2.1,3.8,0.9,2.5,3.6);
insert into PlayerInfo values ('Joffrey','Lauvergne','CHI',70,14,5.4,2.1,4.8,0.5,1.4,0.7,1,1,2.6,1,0.8,0.4,0.1,1.2);
insert into PlayerInfo values ('John','Henson','MIL',58,19.4,6.8,2.7,5.3,0,0,1.3,1.8,1.6,3.5,1,0.9,0.5,1.3,2.6);
insert into PlayerInfo values ('John','Jenkins','PHX',4,3.2,1.8,0.5,1.3,0.3,0.5,0.5,0.5,0,0.3,0.3,0,0,0,0);
insert into PlayerInfo values ('John','Lucas III','MIN',5,2.1,0.4,0.2,0.8,0,0.2,0,0,0,0,0.2,0,0.4,0,0);
insert into PlayerInfo values ('John','Wall','WAS',78,36.4,23.1,8.3,18.4,1.1,3.5,5.4,6.8,0.8,3.4,10.7,4.1,2,0.6,1.9);
insert into PlayerInfo values ('Johnny','Bryant III','CHA',11,7.3,3.5,1.4,2.7,0.3,0.5,0.5,0.5,0.8,0.9,0.5,0.5,0,0.1,0.9);
insert into PlayerInfo values ('Jon','Leuer','DET',75,26.3,10.2,4.1,8.6,0.7,2.2,1.3,1.5,1.4,4,1.5,0.9,0.4,0.3,1.9);
insert into PlayerInfo values ('Jonas','Jerebko','BOS',78,15.8,3.8,1.5,3.4,0.6,1.7,0.3,0.5,0.8,2.7,0.9,0.5,0.3,0.2,1.6);
insert into PlayerInfo values ('Jonas','Valanciunas','TOR',79,25.9,12,4.9,8.8,0,0,2.2,2.7,2.8,6.7,0.7,1.3,0.5,0.8,2.7);
insert into PlayerInfo values ('Jonathan','Gibson','DAL',17,13.6,6.2,2.1,5.6,0.9,2.6,1.2,1.7,0.1,1.2,1.5,1.2,0.5,0,1.2);
insert into PlayerInfo values ('Jonathon','Simmons','SAS',77,17.9,6.2,2.3,5.4,0.4,1.3,1.3,1.7,0.3,1.8,1.6,1,0.6,0.3,1.9);
insert into PlayerInfo values ('Jordan','Clarkson','LAL',82,29.2,14.7,5.8,13.1,1.4,4.3,1.6,2,0.6,2.4,2.6,2,1.1,0.1,1.8);
insert into PlayerInfo values ('Jordan','Crawford','NOP',19,23.3,14.1,5.5,11.5,1.9,5,1.1,1.4,0.2,1.6,3,1.3,0.6,0.1,1.6);
insert into PlayerInfo values ('Jordan','Farmar','SAC',2,17.7,6,2,6,2,4.5,0,0,0.5,1,4.5,1.5,1,0,0.5);
insert into PlayerInfo values ('Jordan','Hill','MIN',7,6.7,1.7,0.7,1.9,0,0,0.3,0.3,1.1,0.9,0,0.6,0.1,0,1.3);
insert into PlayerInfo values ('Jordan','McRae','CLE',37,10.4,4.4,1.6,4.1,0.5,1.4,0.7,0.9,0.2,0.9,0.5,0.4,0.2,0.2,0.8);
insert into PlayerInfo values ('Jordan','Mickey','BOS',25,5.6,1.5,0.6,1.4,0,0,0.3,0.6,0.5,0.8,0.3,0.4,0.1,0.2,0.5);
insert into PlayerInfo values ('Jose','Calderon','ATL',41,13.1,3.4,1.3,3.3,0.5,1.6,0.3,0.3,0.4,1.4,2.1,1,0.3,0,0.9);
insert into PlayerInfo values ('Josh','Huestis','OKC',2,15.4,7,3,5.5,1,2,0,0.5,2,2.5,1.5,0,0,1.5,0);
insert into PlayerInfo values ('Josh','McRoberts','MIA',22,17.3,4.9,2,5.4,0.6,1.4,0.3,0.4,1,2.3,2.3,1,0.5,0.2,1.4);
insert into PlayerInfo values ('Josh','Richardson','MIA',53,30.5,10.2,3.8,9.7,1.4,4.3,1.1,1.5,0.7,2.5,2.6,1.2,1.1,0.7,2.5);
insert into PlayerInfo values ('Jrue','Holiday','NOP',67,32.7,15.4,6,13.3,1.5,4.2,1.8,2.5,0.7,3.3,7.3,2.9,1.5,0.7,2);
insert into PlayerInfo values ('Juan','Hernangomez','DEN',61,13.7,4.9,1.6,3.6,0.7,1.8,0.9,1.2,0.7,2.3,0.5,0.5,0.5,0.2,1);
insert into PlayerInfo values ('Julius','Randle','LAL',74,28.8,13.2,5.1,10.4,0.2,0.9,2.8,3.8,2,6.6,3.6,2.3,0.7,0.5,3.4);
insert into PlayerInfo values ('Justin','Anderson','PHI',74,16.6,7.1,2.5,5.9,0.8,2.6,1.4,1.7,0.9,2.3,0.9,0.9,0.5,0.3,1.5);
insert into PlayerInfo values ('Justin','Hamilton','BKN',63,18.3,6.9,2.7,5.9,0.9,2.8,0.6,0.8,1.1,3,0.9,0.7,0.5,0.7,1.4);
insert into PlayerInfo values ('Justin','Harper','PHI',3,10.4,4,1.7,4,0.7,2.3,0,0,0.7,1,0.7,1.3,0,0,0.7);
insert into PlayerInfo values ('Justin','Holiday','NYK',82,20,7.7,2.8,6.6,1.2,3.3,0.8,1,0.3,2.4,1.2,0.8,0.8,0.4,1.3);
insert into PlayerInfo values ('Justise','Winslow','MIA',18,34.7,10.9,4.4,12.5,0.4,1.9,1.6,2.6,1.3,3.9,3.7,1.8,1.4,0.3,2.9);
insert into PlayerInfo values ('Jusuf','Nurkic','POR',64,21.6,10.2,4.2,8.2,0,0,1.8,3.2,2.4,4.8,1.9,2.2,0.8,1.1,2.5);
insert into PlayerInfo values ('KJ','McDaniels','BKN',49,10.3,4.2,1.6,3.4,0.4,1.3,0.7,0.8,0.3,1.4,0.3,0.6,0.4,0.4,1);
insert into PlayerInfo values ('Karl-Anthony','Towns','MIN',82,37,25.1,9.8,18,1.2,3.4,4.3,5.2,3.6,8.7,2.7,2.6,0.7,1.3,2.9);
insert into PlayerInfo values ('Kawhi','Leonard','SAS',73,33.7,25.5,8.6,17.7,2,5.2,6.3,7.2,1.1,4.7,3.5,2.1,1.8,0.7,1.6);
insert into PlayerInfo values ('Kay','Felder','CLE',42,9.2,4,1.5,3.8,0.2,0.5,0.8,1.2,0.1,0.9,1.4,0.7,0.4,0.2,0.9);
insert into PlayerInfo values ('Kelly','Olynyk','BOS',75,20.5,9,3.5,6.8,0.9,2.6,1.2,1.6,1,3.8,2,1.3,0.6,0.4,2.8);
insert into PlayerInfo values ('Kelly','Oubre Jr.','WAS',79,20.3,6.3,2.4,5.6,0.7,2.4,0.9,1.3,0.8,2.5,0.6,0.6,0.7,0.2,2.5);
insert into PlayerInfo values ('Kemba','Walker','CHA',79,34.7,23.2,8.1,18.3,3,7.6,3.8,4.5,0.6,3.3,5.5,2.1,1.1,0.3,1.5);
insert into PlayerInfo values ('Kenneth','Faried','DEN',60,21.3,9.6,3.7,6.8,0,0.1,2.1,3.1,3,4.6,0.9,1,0.7,0.7,2);
insert into PlayerInfo values ('Kent','Bazemore','ATL',73,26.9,11,4,9.9,1.3,3.6,1.6,2.3,0.6,2.5,2.4,1.7,1.2,0.7,2.3);
insert into PlayerInfo values ('Kentavious','Caldwell-Pope','DET',76,33.6,13.8,4.9,12.2,2,5.8,2,2.4,0.7,2.5,2.5,1.1,1.2,0.2,1.6);
insert into PlayerInfo values ('Kevin','Durant','GSW',62,33.4,25.1,8.9,16.5,1.9,5,5.4,6.2,0.6,7.6,4.8,2.2,1.1,1.6,1.9);
insert into PlayerInfo values ('Kevin','Love','CLE',60,31.4,19,6.2,14.5,2.4,6.5,4.3,4.9,2.5,8.6,1.9,2,0.9,0.4,2.1);
insert into PlayerInfo values ('Kevin','Seraphin','IND',48,11.2,4.7,2.2,4,0,0,0.3,0.4,0.8,2.1,0.5,0.6,0.1,0.4,1.3);
insert into PlayerInfo values ('Kevon','Looney','GSW',53,8.4,2.5,1.1,2,0,0.2,0.4,0.6,0.8,1.5,0.5,0.3,0.3,0.3,1.2);
insert into PlayerInfo values ('Khris','Middleton','MIL',29,30.7,14.7,5.2,11.5,1.6,3.6,2.8,3.2,0.4,3.9,3.4,2.2,1.4,0.2,2.7);
insert into PlayerInfo values ('Klay','Thompson','GSW',78,34,22.3,8.3,17.6,3.4,8.3,2.4,2.8,0.6,3,2.1,1.6,0.8,0.5,1.8);
insert into PlayerInfo values ('Kosta','Koufos','SAC',71,20,6.6,3,5.5,0,0,0.5,0.9,1.7,4,0.7,0.9,0.5,0.7,2.4);
insert into PlayerInfo values ('Kris','Dunn','MIN',78,17.1,3.8,1.5,4,0.3,0.9,0.5,0.8,0.3,1.8,2.4,1.1,1,0.5,2.3);
insert into PlayerInfo values ('Kris','Humphries','ATL',56,12.3,4.6,1.6,3.8,0.3,1,1.1,1.5,1.1,2.6,0.5,0.5,0.3,0.4,1.2);
insert into PlayerInfo values ('Kristaps','Porzingis','NYK',66,32.8,18.1,6.7,14.9,1.7,4.8,3,3.8,1.7,5.5,1.5,1.8,0.7,2,3.7);
insert into PlayerInfo values ('Kyle','Anderson','SAS',71,14.2,3.4,1.3,2.9,0.2,0.6,0.6,0.8,0.5,2.4,1.3,0.5,0.7,0.4,0.9);
insert into PlayerInfo values ('Kyle','Korver','CLE',67,26.2,10.1,3.6,7.7,2.4,5.4,0.6,0.6,0.1,2.7,1.6,1,0.5,0.3,1.6);
insert into PlayerInfo values ('Kyle','Lowry','TOR',60,37.5,22.4,7.1,15.3,3.2,7.8,5,6.1,0.8,4,7,2.9,1.5,0.3,2.8);
insert into PlayerInfo values ('Kyle','Quinn','NYK',79,15.6,6.3,2.7,5.2,0,0.2,0.8,1.1,2,3.6,1.5,1,0.5,1.3,2.2);
insert into PlayerInfo values ('Kyle','Singler','OKC',32,12,2.8,1.1,2.6,0.2,1.2,0.4,0.5,0.3,1.3,0.3,0.3,0.2,0.2,0.9);
insert into PlayerInfo values ('Kyle','Wiltjer','HOU',14,3.1,0.9,0.3,1,0.3,0.9,0.1,0.1,0.3,0.4,0.1,0.4,0.2,0.1,0.3);
insert into PlayerInfo values ('Kyrie','Irving','CLE',72,35.1,25.2,9.3,19.7,2.5,6.1,4.1,4.6,0.7,2.5,5.8,2.5,1.2,0.3,2.2);
insert into PlayerInfo values ('LaMarcus','Aldridge','SAS',71,32.6,17.3,6.9,14.6,0.3,0.8,3.1,3.8,2.4,4.9,1.9,1.4,0.6,1.2,2.2);
insert into PlayerInfo values ('Lamar','Patterson','ATL',5,8.1,1.8,0.6,3,0.2,1.2,0.4,0.6,0.2,1.2,1.2,0.8,0.2,0,1.2);
insert into PlayerInfo values ('Lance','Stephenson','IND',18,20.1,6.8,3,6.7,0.3,1.1,0.4,0.7,0.2,2.7,3.3,1.4,0.3,0.2,1.8);
insert into PlayerInfo values ('Lance','Thomas','NYK',46,21,6,2.1,5.3,0.8,1.8,0.9,1.1,0.7,2.4,0.8,0.5,0.5,0.1,1.8);
insert into PlayerInfo values ('Langston','Galloway','SAC',74,20.2,7.9,2.8,7.4,1.6,4.2,0.7,0.9,0.4,1.7,1.3,0.6,0.6,0.1,1.3);
insert into PlayerInfo values ('Larry','Nance Jr.','LAL',63,22.9,7.1,3,5.7,0.2,0.6,0.9,1.3,1.9,4,1.5,0.9,1.3,0.6,2.4);
insert into PlayerInfo values ('Larry','Sanders','CLE',5,2.5,0.8,0.2,0.8,0,0,0.4,0.4,0.6,0.2,0,0.4,0.2,0.2,1);
insert into PlayerInfo values ('Lavoy','Allen','IND',60,14.5,2.9,1.3,2.8,0,0,0.4,0.5,1.7,1.9,0.9,0.5,0.3,0.4,1.3);
insert into PlayerInfo values ('LeBron','James','CLE',74,37.8,26.4,9.9,18.2,1.7,4.6,4.8,7.2,1.3,7.3,8.7,4.1,1.2,0.6,1.8);
insert into PlayerInfo values ('Leandro','Barbosa','PHX',65,14.5,6.3,2.6,5.9,0.5,1.5,0.6,0.7,0.2,1.3,1.2,0.7,0.5,0.1,1.2);
insert into PlayerInfo values ('Lou','Williams','HOU',81,24.6,17.5,5.3,12.3,2,5.5,5,5.6,0.3,2.2,3,2,1,0.2,1.1);
insert into PlayerInfo values ('Luc','Mbah a Moute','LAC',80,22.3,6.1,2.4,4.7,0.5,1.4,0.7,1.1,0.6,1.6,0.5,0.6,1,0.4,1.5);
insert into PlayerInfo values ('Lucas','Nogueira','TOR',56,19,4.4,1.8,2.7,0.1,0.2,0.8,1.2,1.4,2.8,0.7,0.8,0.9,1.6,2.4);
insert into PlayerInfo values ('Luis','Scola','BKN',35,12.7,5.1,2,4.2,0.5,1.4,0.7,1,1.4,2.4,1,0.9,0.4,0.1,1.8);
insert into PlayerInfo values ('Luke','Babbitt','MIA',68,15.7,4.8,1.7,4.1,1.3,3.1,0.2,0.2,0.2,1.9,0.5,0.4,0.3,0.2,1.7);
insert into PlayerInfo values ('Luol','Deng','LAL',56,26.5,7.6,2.9,7.6,0.9,2.9,0.8,1.1,1.1,4.1,1.3,0.8,0.9,0.4,1.1);
insert into PlayerInfo values ('Malachi','Richardson','SAC',22,9,3.6,1.3,3.1,0.4,1.3,0.7,0.9,0.1,0.9,0.5,0.4,0.2,0,1);
insert into PlayerInfo values ('Malcolm','Brogdon','MIL',75,26.4,10.2,3.9,8.5,1,2.6,1.5,1.7,0.6,2.2,4.2,1.5,1.1,0.2,1.9);
insert into PlayerInfo values ('Malcolm','Delaney','ATL',73,17.1,5.4,2,5.3,0.4,1.5,1,1.3,0.1,1.5,2.6,1.3,0.5,0,1.5);
insert into PlayerInfo values ('Malik','Beasley','DEN',22,7.3,3.8,1.5,3.3,0.4,1.3,0.4,0.5,0.2,0.5,0.5,0.4,0.3,0,0.5);
insert into PlayerInfo values ('Manny','Harris','DAL',4,6.2,2,0.8,3.8,0,0.5,0.5,1,0.8,1.5,0.5,0.5,0,0,0.3);
insert into PlayerInfo values ('Manu','Ginobili','SAS',68,18.6,7.5,2.5,6.4,1.3,3.3,1.2,1.6,0.4,1.9,2.7,1.4,1.2,0.2,1.7);
insert into PlayerInfo values ('Marc','Gasol','MEM',74,34.2,19.5,7.2,15.7,1.4,3.6,3.8,4.5,0.8,5.5,4.6,2.2,0.9,1.3,2.3);
insert into PlayerInfo values ('Marcelo','Huertas','LAL',23,10.3,2.7,1.1,3,0.2,0.8,0.4,0.7,0.1,1,2.3,0.8,0.4,0.1,0.7);
insert into PlayerInfo values ('Marcin','Gortat','WAS',82,31.2,10.8,4.8,8.2,0,0,1.3,1.9,2.9,7.5,1.5,1.5,0.5,0.7,2.6);
insert into PlayerInfo values ('Marco','Belinelli','CHA',74,24,10.5,3.6,8.3,1.4,3.8,2,2.3,0.2,2.2,2,0.9,0.6,0.1,1.2);
insert into PlayerInfo values ('Marcus','Georges-Hunt','ORL',5,9.5,2.8,0.4,1.4,0.2,0.4,1.8,2,0.2,1.6,0.6,0.4,0.2,0,1);
insert into PlayerInfo values ('Marcus','Morris','DET',79,32.8,14,5.3,12.7,1.5,4.5,1.8,2.3,1,3.7,2,1.1,0.7,0.3,2.1);
insert into PlayerInfo values ('Marcus','Smart','BOS',79,30.4,10.6,3.4,9.5,1.2,4.2,2.6,3.2,1,2.9,4.6,2,1.6,0.4,2.4);
insert into PlayerInfo values ('Marcus','Thornton','WAS',33,17.4,6.6,2.5,6.4,0.8,2.4,0.7,0.8,0.7,1.6,1.2,0.8,0.6,0.1,1.5);
insert into PlayerInfo values ('Mario','Hezonja','ORL',65,14.8,4.9,1.8,5.1,0.7,2.2,0.6,0.8,0.3,1.9,1,0.9,0.5,0.2,1.1);
insert into PlayerInfo values ('Markieff','Morris','WAS',76,31.2,14,5.3,11.7,0.9,2.6,2.4,2.8,1.4,5.1,1.7,1.7,1.1,0.6,3.3);
insert into PlayerInfo values ('Marquese','Chriss','PHX',80,21.3,9.2,3.5,7.7,0.9,2.7,1.4,2.2,1.2,3.1,0.7,1.3,0.8,0.9,3.2);
insert into PlayerInfo values ('Marreese','Speights','LAC',82,15.7,8.7,3,6.7,1.3,3.4,1.5,1.7,1.1,3.5,0.8,0.8,0.3,0.5,2.8);
insert into PlayerInfo values ('Marshall','Plumlee','NYK',21,8.1,1.9,0.8,1.4,0,0,0.4,0.9,1.1,1.3,0.5,0.6,0.2,0.2,1.1);
insert into PlayerInfo values ('Marvin','Williams','CHA',76,30.2,11.2,3.9,9.3,1.6,4.7,1.7,2,1.2,5.4,1.4,0.8,0.8,0.7,1.8);
insert into PlayerInfo values ('Mason','Plumlee','DEN',81,26.5,10.4,4.1,7.7,0,0.1,2.1,3.7,2.1,5.4,3.5,1.7,0.9,1.1,2.8);
insert into PlayerInfo values ('Matt','Barnes','GSW',74,24,7.1,2.5,6.4,1.2,3.6,0.9,1.2,0.9,4.2,2.6,1.4,0.6,0.4,2.5);
insert into PlayerInfo values ('Matthew','Dellavedova','MIL',76,26.1,7.6,2.7,7,1,2.8,1.1,1.3,0.3,1.6,4.7,1.8,0.7,0,2);
insert into PlayerInfo values ('Maurice','Harkless','POR',77,28.9,10,4.1,8.1,0.9,2.5,1,1.6,1.6,2.8,1.1,1.1,1.1,0.9,2.8);
insert into PlayerInfo values ('Maurice','Ndour','NYK',32,10.4,3.1,1.2,2.7,0,0.2,0.6,0.8,0.7,1.3,0.3,0.4,0.5,0.3,0.9);
insert into PlayerInfo values ('Metta','Peace','LAL',25,6.4,2.3,0.8,2.7,0.4,1.5,0.4,0.6,0.2,0.6,0.4,0.3,0.4,0.1,0.7);
insert into PlayerInfo values ('Meyers','Leonard','POR',74,16.5,5.4,2,5.1,1,2.9,0.5,0.5,0.4,2.8,1,0.5,0.2,0.4,2.3);
insert into PlayerInfo values ('Michael','Beasley','MIL',56,16.7,9.4,3.9,7.3,0.3,0.8,1.4,1.9,0.7,2.7,0.9,1.2,0.5,0.5,1.6);
insert into PlayerInfo values ('Michael','Carter-Williams','CHI',45,18.8,6.6,2.5,6.8,0.3,1.4,1.3,1.7,0.5,2.9,2.5,1.5,0.8,0.5,2.3);
insert into PlayerInfo values ('Michael','Gbinije','DET',9,3.5,0.4,0.1,1.1,0,0.4,0.2,0.2,0.2,0.1,0.2,0,0,0,0.2);
insert into PlayerInfo values ('Michael','Kidd-Gilchrist','CHA',81,29,9.2,3.6,7.6,0,0.1,1.9,2.4,1.9,5,1.4,0.7,1,1,2.3);
insert into PlayerInfo values ('Mike','Conley','MEM',69,33.2,20.5,6.7,14.6,2.5,6.1,4.6,5.3,0.4,3,6.3,2.3,1.3,0.3,1.8);
insert into PlayerInfo values ('Mike','Dunleavy','ATL',53,15.9,5.2,1.8,4.2,1,2.5,0.7,0.8,0.3,1.8,0.9,0.5,0.3,0.1,1.3);
insert into PlayerInfo values ('Mike','Miller','DEN',19,7.8,1.4,0.5,1.2,0.4,1,0.1,0.1,0.1,1.8,1.1,0.7,0.1,0,0.5);
insert into PlayerInfo values ('Mike','Muscala','ATL',70,17.7,6.2,2.4,4.8,0.7,1.6,0.7,0.9,1.1,2.3,1.4,0.8,0.4,0.6,1.4);
insert into PlayerInfo values ('Mike','Scott','ATL',18,10.8,2.5,0.9,3.3,0.2,1.5,0.4,0.4,0.6,1.5,0.9,0.4,0.2,0.2,0.7);
insert into PlayerInfo values ('Mike','Tobey','CHA',2,12.6,1,0.5,2,0,0,0,0,1,0.5,0.5,0.5,0,0,1);
insert into PlayerInfo values ('Miles','Plumlee','CHA',45,10.8,2.5,1,2,0,0,0.6,0.9,0.8,1.3,0.5,0.7,0.4,0.3,1.6);
insert into PlayerInfo values ('Mindaugas','Kuzminskas','NYK',68,14.9,6.3,2.3,5.4,0.8,2.5,0.8,1,0.7,1.2,1,0.8,0.4,0.2,1.2);
insert into PlayerInfo values ('Mirza','Teletovic','MIL',70,16.2,6.4,2.2,6,1.5,4.4,0.5,0.6,0.2,2.2,0.7,0.5,0.2,0.2,1.6);
insert into PlayerInfo values ('Monta','Ellis','IND',73,27,8.5,3.3,7.5,0.6,1.8,1.3,1.7,0.3,2.5,3.2,1.8,1.1,0.4,2);
insert into PlayerInfo values ('Montrezl','Harrell','HOU',58,18.3,9.1,3.9,5.9,0,0.1,1.3,2.1,1.4,2.4,1.1,0.8,0.3,0.7,2.2);
insert into PlayerInfo values ('Myles','Turner','IND',80,31.5,14.5,5.5,10.7,0.5,1.4,3,3.7,1.7,5.6,1.3,1.3,0.9,2.1,3.2);
insert into PlayerInfo values ('Nemanja','Bjelica','MIN',65,18.3,6.2,2.3,5.5,0.9,2.7,0.7,0.9,0.9,2.9,1.2,0.9,0.6,0.3,2.4);
insert into PlayerInfo values ('Nene','Hilario','HOU',67,17.9,9.1,3.7,5.9,0,0.1,1.7,2.9,1.4,2.8,1,1.1,0.8,0.6,2.4);
insert into PlayerInfo values ('Nerlens','Noel','DAL',51,20.5,8.7,3.6,6.1,0,0,1.5,2.2,1.8,3.9,1,1,1.3,1,2.5);
insert into PlayerInfo values ('Nick','Collison','OKC',20,6.4,1.7,0.7,1.2,0,0.1,0.3,0.4,0.5,1.1,0.6,0.2,0.1,0.1,0.9);
insert into PlayerInfo values ('Nick','Young','LAL',60,25.9,13.2,4.5,10.6,2.8,7,1.3,1.5,0.4,1.9,1,0.6,0.6,0.2,2.3);
insert into PlayerInfo values ('Nicolas','Batum','CHA',77,34,15.1,5.1,12.7,1.8,5.3,3.2,3.7,0.6,5.6,5.9,2.5,1.1,0.4,1.4);
insert into PlayerInfo values ('Nicolas','Brussino','DAL',54,9.7,2.8,1,2.6,0.5,1.8,0.3,0.4,0.5,1.3,0.9,0.5,0.3,0.1,0.8);
insert into PlayerInfo values ('Nicolas','Laprovittola','SAS',18,9.7,3.3,1.1,2.6,0.6,1.5,0.5,0.5,0.1,0.5,1.6,1.1,0.2,0.1,1.1);
insert into PlayerInfo values ('Nik','Stauskas','PHI',80,27.3,9.5,3.1,7.9,1.7,4.5,1.5,1.9,0.3,2.6,2.4,1.6,0.6,0.4,1.8);
insert into PlayerInfo values ('Nikola','Jokic','DEN',72,27.9,16.7,6.8,11.7,0.6,1.9,2.6,3.1,2.9,6.9,4.9,2.3,0.8,0.8,2.9);
insert into PlayerInfo values ('Nikola','Mirotic','CHI',70,24,10.6,3.7,8.9,1.8,5.4,1.4,1.8,0.9,4.6,1.1,1.1,0.8,0.8,1.8);
insert into PlayerInfo values ('Nikola','Vucevic','ORL',75,29,14.6,6.4,13.7,0.3,1,1.4,2.1,2.3,8,2.8,1.6,1,1,2.4);
insert into PlayerInfo values ('Noah','Vonleh','POR',74,17.1,4.4,1.8,3.6,0.1,0.3,0.8,1.3,1.8,3.5,0.4,0.9,0.4,0.4,2.1);
insert into PlayerInfo values ('Norman','Powell','TOR',75,17.9,8.4,3,6.7,0.7,2.3,1.7,2.1,0.3,1.9,1.1,0.9,0.7,0.2,1.7);
insert into PlayerInfo values ('Norris','Cole','OKC',13,9.6,3.3,1.2,4,0.2,1,0.6,0.8,0,0.8,1.1,0.5,0.6,0,1.4);
insert into PlayerInfo values ('Okaro','White','MIA',35,13.5,2.8,0.9,2.5,0.3,1,0.6,0.6,0.7,1.6,0.6,0.5,0.3,0.3,1.5);
insert into PlayerInfo values ('Omer','Asik','NOP',31,15.6,2.7,1,2.1,0,0,0.7,1.3,1.5,3.7,0.5,0.5,0.2,0.3,1.6);
insert into PlayerInfo values ('Omri','Casspi','MIN',36,17.8,5.2,2.1,4.6,0.4,1.2,0.5,0.8,0.8,2.4,1,0.8,0.6,0.1,1.4);
insert into PlayerInfo values ('Otto','Porter Jr.','WAS',80,32.6,13.4,5.2,10,1.9,4.3,1.2,1.5,1.5,5,1.5,0.6,1.5,0.5,2.4);
insert into PlayerInfo values ('PJ','Tucker','TOR',79,27.6,6.7,2.5,6,0.9,2.4,0.9,1.1,1.4,4.4,1.2,0.8,1.4,0.2,2.4);
insert into PlayerInfo values ('Pascal','Siakam','TOR',54,15.4,4.2,1.9,3.7,0,0.1,0.4,0.6,1.2,2.2,0.3,0.6,0.5,0.8,2);
insert into PlayerInfo values ('Pat','Connaughton','POR',39,8.1,2.5,0.9,1.8,0.4,0.8,0.2,0.2,0.3,1.1,0.7,0.4,0.2,0.1,0.6);
insert into PlayerInfo values ('Patricio','Garino','ORL',5,8.6,0,0,1.4,0,1,0,0,0.2,1.2,0,0.6,0,0,0.8);
insert into PlayerInfo values ('Patrick','Beverley','HOU',67,30.7,9.5,3.4,8.1,1.6,4.3,1.1,1.4,1.4,4.4,4.2,1.5,1.5,0.4,3.3);
insert into PlayerInfo values ('Patrick','McCaw','GSW',71,15.1,4,1.5,3.5,0.6,1.7,0.4,0.5,0.3,1.1,1.1,0.5,0.5,0.2,0.9);
insert into PlayerInfo values ('Patrick','Patterson','TOR',65,24.6,6.8,2.4,5.9,1.4,3.9,0.7,0.9,1,3.6,1.2,0.6,0.6,0.4,1.8);
insert into PlayerInfo values ('Patty','Mills','SAS',80,21.9,9.5,3.4,7.8,1.8,4.4,0.8,1,0.3,1.5,3.5,1.3,0.8,0,1.4);
insert into PlayerInfo values ('Pau','Gasol','SAS',63,25.4,12.4,4.7,9.4,0.9,1.6,2,2.9,1.7,6.2,2.3,1.3,0.4,1.1,1.7);
insert into PlayerInfo values ('Paul','George','IND',74,35.9,23.7,8.3,18,2.6,6.6,4.5,5,0.8,5.8,3.3,2.9,1.6,0.4,2.7);
insert into PlayerInfo values ('Paul','Millsap','ATL',69,34,18.1,6.2,14.1,1.1,3.5,4.5,5.9,1.6,6.1,3.7,2.3,1.3,0.9,2.7);
insert into PlayerInfo values ('Paul','Pierce','LAC',25,11.1,3.2,1.1,2.8,0.6,1.7,0.4,0.5,0,1.9,0.4,0.6,0.2,0.2,1.6);
insert into PlayerInfo values ('Paul','Zipser','CHI',44,19.2,5.5,2,5,0.8,2.3,0.7,0.9,0.3,2.5,0.8,0.9,0.3,0.4,1.8);
insert into PlayerInfo values ('Pierre','Jackson','DAL',9,9.4,4.4,1.6,4.9,0.4,1.4,0.8,0.9,0.1,1,2.4,0.4,0.3,0,0.6);
insert into PlayerInfo values ('Quincy','Acy','BKN',38,14.7,5.8,1.8,4.5,1,2.4,1.2,1.6,0.5,2.5,0.5,0.6,0.4,0.4,1.8);
insert into PlayerInfo values ('Quinn','Cook','NOP',14,13.4,5.6,2.4,4.7,0.8,1.9,0.1,0.4,0.1,0.4,1.9,0.9,0.3,0,0.9);
insert into PlayerInfo values ('RJ','Hunter','CHI',3,3.1,0,0,0.3,0,0.3,0,0,0,0.3,0,0,0,0,0);
insert into PlayerInfo values ('Rajon','Rondo','CHI',69,26.7,7.8,3.3,8.1,0.7,1.9,0.4,0.7,1.1,4.1,6.7,2.4,1.4,0.2,2.1);
insert into PlayerInfo values ('Rakeem','Christmas','IND',29,7.6,2,0.7,1.5,0,0,0.7,1,0.9,1,0.1,0.3,0.1,0.2,1.3);
insert into PlayerInfo values ('Ramon','Sessions','CHA',50,16.2,6.2,2,5.3,0.4,1.2,1.8,2.4,0.2,1.2,2.6,0.9,0.5,0.1,0.9);
insert into PlayerInfo values ('Randy','Foye','BKN',68,18.8,5.2,1.7,4.7,1,2.9,0.8,0.9,0.1,2.1,2,1.2,0.5,0.1,1.4);
insert into PlayerInfo values ('Rashad','Vaughn','MIL',41,11.2,3.5,1.4,3.8,0.6,2,0,0.1,0.1,1.1,0.6,0.3,0.5,0.2,0.8);
insert into PlayerInfo values ('Raul','Neto','UTA',40,8.6,2.5,1,2.3,0.3,0.8,0.2,0.2,0.1,0.7,0.9,0.4,0.5,0.1,1.2);
insert into PlayerInfo values ('Raymond','Felton','LAC',80,21.2,6.7,2.8,6.4,0.6,1.8,0.6,0.8,0.4,2.3,2.4,1,0.8,0.3,1.6);
insert into PlayerInfo values ('Reggie','Bullock','DET',31,15.1,4.5,1.7,4.1,0.9,2.4,0.2,0.2,0.4,1.6,0.9,0.3,0.6,0.1,0.7);
insert into PlayerInfo values ('Reggie','Jackson','DET',52,27.9,14.5,5.5,13,1.3,3.5,2.3,2.6,0.4,1.8,5.2,2.2,0.7,0.1,2.5);
insert into PlayerInfo values ('Reggie','Williams','NOP',6,13.2,4.5,1.3,3.8,0.8,1.8,1,1.2,0.3,0.7,0.7,0,0.5,0,0.3);
insert into PlayerInfo values ('Richard','Jefferson','CLE',79,20.4,5.7,1.9,4.3,0.8,2.4,1,1.4,0.4,2.2,1,0.7,0.3,0.1,1.9);
insert into PlayerInfo values ('Richaun','Holmes','PHI',57,20.9,9.8,4,7.2,0.5,1.4,1.3,1.8,1.6,3.8,1,1,0.7,1,2.4);
insert into PlayerInfo values ('Ricky','Rubio','MIN',75,32.9,11.1,3.5,8.7,0.8,2.6,3.4,3.8,0.9,3.2,9.1,2.6,1.7,0.1,2.7);
insert into PlayerInfo values ('Robert','Covington','PHI',67,31.6,12.9,4.4,10.9,2,6.1,2.1,2.6,1.4,5.1,1.5,2,1.9,1,3);
insert into PlayerInfo values ('Robin','Lopez','CHI',81,28,10.4,4.7,9.6,0,0,0.9,1.3,3,3.4,1,1.1,0.2,1.4,1.9);
insert into PlayerInfo values ('Rodney','Hood','UTA',59,27,12.7,4.6,11.3,1.9,5.2,1.5,1.9,0.3,3.2,1.6,1.1,0.6,0.2,2.2);
insert into PlayerInfo values ('Rodney','McGruder','MIA',78,25.2,6.4,2.4,5.9,0.9,2.8,0.6,0.9,1.2,2.1,1.6,0.7,0.6,0.2,1.8);
insert into PlayerInfo values ('Rodney','Stuckey','IND',39,17.9,7.2,2.3,6.3,0.5,1.5,2.1,2.7,0.2,2,2.2,1.4,0.4,0,1.1);
insert into PlayerInfo values ('Ron','Baker','NYK',52,16.5,4.1,1.6,4.2,0.4,1.7,0.5,0.8,0.2,1.7,2.1,1.1,0.7,0.2,1.4);
insert into PlayerInfo values ('Rondae','Hollis-Jefferson','BKN',77,22.6,8.7,3,6.9,0.2,0.9,2.4,3.2,1.2,4.6,2,1.5,1.1,0.6,2.3);
insert into PlayerInfo values ('Ronnie','Price','PHX',14,9.6,1,0.3,1.7,0.2,1.2,0.2,0.3,0.2,0.6,1.3,0.2,0.8,0.1,1);
insert into PlayerInfo values ('Roy','Hibbert','DEN',48,14.2,4.6,1.7,3.1,0,0,1.3,1.6,1.1,2,0.4,0.7,0.2,1,2.1);
insert into PlayerInfo values ('Rudy','Gay','SAC',30,33.8,18.7,6.7,14.7,1.4,3.8,3.9,4.6,1.2,5.2,2.8,2.5,1.5,0.9,2.6);
insert into PlayerInfo values ('Rudy','Gobert','UTA',81,33.9,14,5.1,7.7,0,0,3.8,5.9,3.9,8.9,1.2,1.8,0.6,2.6,3);
insert into PlayerInfo values ('Russell','Westbrook','OKC',81,34.6,31.6,10.2,24,2.5,7.2,8.8,10.4,1.7,9,10.4,5.4,1.6,0.4,2.3);
insert into PlayerInfo values ('Ryan','Anderson','HOU',72,29.4,13.6,4.5,10.7,2.8,7,1.8,2.1,1.6,3,0.9,0.8,0.4,0.2,2);
insert into PlayerInfo values ('Ryan','Kelly','ATL',16,6.9,1.6,0.5,1.8,0.3,0.6,0.3,0.4,0.1,1.1,0.5,0.3,0.3,0.3,0.3);
insert into PlayerInfo values ('Salah','Mejri','DAL',72,12.3,2.9,1.2,1.9,0,0,0.5,0.8,1.3,2.9,0.2,0.5,0.4,0.8,2.1);
insert into PlayerInfo values ('Sam','Dekker','HOU',77,18.4,6.5,2.6,5.6,0.8,2.4,0.5,0.9,1.2,2.5,1,0.5,0.5,0.3,1.1);
insert into PlayerInfo values ('Sasha','Vujacic','NYK',42,9.7,3,1,3.2,0.5,1.8,0.4,0.6,0.3,1.1,1.2,0.4,0.3,0,0.9);
insert into PlayerInfo values ('Sean','Kilpatrick','BKN',69,25.1,13.1,4.4,10.5,1.5,4.4,2.9,3.5,0.3,3.7,2.2,1.9,0.6,0.1,1.7);
insert into PlayerInfo values ('Semaj','Christon','OKC',64,15.2,2.9,1.2,3.5,0.2,1,0.3,0.5,0.3,1.1,2,0.7,0.4,0.1,1.2);
insert into PlayerInfo values ('Serge','Ibaka','TOR',79,30.7,14.8,6,12.4,1.6,4,1.4,1.6,1.6,5.2,0.9,1.3,0.5,1.6,2.7);
insert into PlayerInfo values ('Sergio','Rodriguez','PHI',68,22.3,7.8,3.1,7.9,1.4,3.7,0.3,0.4,0.3,2,5.1,1.9,0.7,0.1,1.4);
insert into PlayerInfo values ('Seth','Curry','DAL',69,29.4,12.8,4.8,10,2,4.6,1.2,1.4,0.4,2.2,2.7,1.3,1.1,0.1,1.8);
insert into PlayerInfo values ('Shabazz','Muhammad','MIN',78,19.4,9.9,3.7,7.7,0.6,1.9,1.9,2.4,1.1,1.7,0.4,0.7,0.3,0.1,1.1);
insert into PlayerInfo values ('Shabazz','Napier','POR',53,9.7,4.1,1.4,3.5,0.6,1.7,0.7,0.9,0.2,1,1.3,0.8,0.6,0,0.7);
insert into PlayerInfo values ('Shaun','Livingston','GSW',76,17.7,5.1,2.3,4.2,0,0,0.6,0.8,0.4,1.6,1.8,0.8,0.5,0.3,1.6);
insert into PlayerInfo values ('Shawn','Long','PHI',18,13,8.2,3.4,6.1,0.4,1.1,1.1,1.9,2.3,2.4,0.7,0.7,0.5,0.5,2.7);
insert into PlayerInfo values ('Sheldon','McClellan','WAS',30,9.6,3,1,2.5,0.2,1,0.8,0.9,0.1,1,0.5,0.2,0.3,0.1,0.6);
insert into PlayerInfo values ('Shelvin','Mack','UTA',55,21.9,7.8,3.1,6.9,0.7,2.2,1,1.4,0.4,1.9,2.8,1.6,0.8,0.1,1.8);
insert into PlayerInfo values ('Skal','Labissiere','SAC',33,18.5,8.8,3.5,6.6,0.1,0.2,1.6,2.2,1.5,3.4,0.8,1.1,0.5,0.4,1.9);
insert into PlayerInfo values ('Solomon','Hill','NOP',80,29.7,7,2.3,6,1.2,3.4,1.3,1.6,0.6,3.2,1.8,1,0.9,0.4,2.3);
insert into PlayerInfo values ('Spencer','Dinwiddie','BKN',58,22.6,7.3,2.3,5.1,0.6,1.7,2.1,2.7,0.5,2.3,3.1,1.1,0.7,0.4,2);
insert into PlayerInfo values ('Spencer','Hawes','MIL',54,14.8,6.2,2.5,5.1,0.5,1.5,0.8,1,0.7,2.8,1.5,0.9,0.3,0.6,1.4);
insert into PlayerInfo values ('Stanley','Johnson','DET',77,17.8,4.4,1.7,4.7,0.6,2,0.5,0.7,0.5,2,1.4,0.9,0.7,0.3,1.6);
insert into PlayerInfo values ('Stephen','Curry','GSW',79,33.4,25.3,8.5,18.3,4.1,10,4.1,4.6,0.8,3.7,6.6,3,1.8,0.2,2.3);
insert into PlayerInfo values ('Stephen','Zimmerman','ORL',19,5.7,1.2,0.5,1.6,0,0,0.2,0.3,0.6,1.3,0.2,0.2,0.1,0.3,0.9);
insert into PlayerInfo values ('Steve','Novak','MIL',8,2.7,0.6,0.3,0.9,0.1,0.8,0,0,0,0.4,0,0,0,0,0.1);
insert into PlayerInfo values ('Steven','Adams','OKC',80,29.9,11.3,4.7,8.2,0,0,2,3.2,3.5,4.2,1.1,1.8,1.1,1,2.4);
insert into PlayerInfo values ('T.J.','McConnell','PHI',81,26.3,6.9,2.9,6.3,0.1,0.7,0.9,1.1,0.5,2.6,6.6,2,1.7,0.1,1.7);
insert into PlayerInfo values ('TJ','Warren','PHX',64,31.2,14.4,6.1,12.3,0.4,1.5,1.8,2.3,1.9,3.2,1.1,0.9,1.2,0.6,2.7);
insert into PlayerInfo values ('Taj','Gibson','OKC',78,25.5,10.8,4.7,9.1,0,0.2,1.4,2,2,4.2,0.9,1.3,0.5,0.8,2.1);
insert into PlayerInfo values ('Tarik','Black','LAL',67,16.3,5.7,2.2,4.4,0,0,1.2,1.6,2.1,3,0.6,0.9,0.4,0.7,2.6);
insert into PlayerInfo values ('Taurean','Prince','ATL',59,16.6,5.7,1.9,4.8,0.6,1.7,1.3,1.6,0.4,2.2,0.9,1,0.7,0.5,1.6);
insert into PlayerInfo values ('Terrence','Jones','MIL',54,23.5,10.8,4.3,9.1,0.4,1.4,1.9,3.1,1.2,4.5,1.1,0.9,0.7,1,1.2);
insert into PlayerInfo values ('Terrence','Ross','ORL',77,25.1,11,4.2,9.6,1.8,5,0.8,1,0.2,2.4,1.1,0.9,1.1,0.4,1.8);
insert into PlayerInfo values ('Terry','Rozier','BOS',74,17.1,5.5,2,5.6,0.8,2.4,0.7,0.9,0.5,2.5,1.8,0.6,0.6,0.1,0.9);
insert into PlayerInfo values ('Thabo','Sefolosha','ATL',62,25.7,7.2,2.8,6.4,0.7,1.9,0.9,1.2,0.9,3.5,1.7,0.9,1.5,0.5,1.6);
insert into PlayerInfo values ('Thaddeus','Young','IND',73,30.3,11,4.9,9.3,0.6,1.6,0.6,1.2,1.8,4.3,1.6,1.3,1.5,0.4,1.8);
insert into PlayerInfo values ('Thomas','Robinson','LAL',48,11.7,5,2.2,4.1,0,0,0.6,1.4,1.8,2.9,0.6,1,0.5,0.2,1.6);
insert into PlayerInfo values ('Thon','Maker','MIL',57,9.9,4,1.5,3.2,0.5,1.3,0.6,0.9,0.7,1.3,0.4,0.3,0.2,0.5,1.5);
insert into PlayerInfo values ('Tiago','Splitter','PHI',8,9.5,4.9,1.8,3.9,0.3,0.8,1.1,1.4,1,1.8,0.5,0.8,0.1,0.1,1);
insert into PlayerInfo values ('Tim','Frazier','NOP',65,23.5,7.1,2.5,6.2,0.6,2,1.5,2,0.5,2.1,5.2,1.6,0.9,0.1,2);
insert into PlayerInfo values ('Tim','Hardaway Jr.','ATL',79,27.3,14.5,5.3,11.5,1.9,5.3,2.1,2.7,0.4,2.4,2.3,1.3,0.7,0.2,1.3);
insert into PlayerInfo values ('Tim','Quarterman','POR',16,5,1.9,0.8,1.8,0.3,0.8,0,0.2,0.3,0.6,0.7,0.7,0.1,0.2,0.4);
insert into PlayerInfo values ('Timofey','Mozgov','LAL',54,20.4,7.4,3.1,6.1,0,0,1.2,1.4,1.9,3,0.8,1.3,0.3,0.6,2.5);
insert into PlayerInfo values ('Timothe','Luwawu-Cabarrot','PHI',69,17.2,6.4,2.1,5.2,0.7,2.3,1.5,1.8,0.4,1.8,1.1,1.1,0.5,0.1,2.2);
insert into PlayerInfo values ('Tobias','Harris','DET',82,31.3,16.1,6.2,13,1.3,3.8,2.3,2.8,0.8,4.3,1.7,1.2,0.7,0.5,1.6);
insert into PlayerInfo values ('Tomas','Satoransky','WAS',57,12.6,2.7,1.1,2.6,0.2,0.6,0.4,0.6,0.4,1,1.6,0.7,0.5,0.1,1.1);
insert into PlayerInfo values ('Toney','Douglas','MEM',24,16.4,4.9,1.8,4.9,0.3,1.8,1,1.2,0.5,2,2.3,0.9,0.8,0.2,2.1);
insert into PlayerInfo values ('Tony','Allen','MEM',71,27,9.1,3.9,8.4,0.2,0.8,1.1,1.8,2.3,3.2,1.4,1.4,1.6,0.4,2.5);
insert into PlayerInfo values ('Tony','Parker','SAS',62,25.3,10.1,4.2,9,0.4,1.1,1.3,1.9,0.1,1.7,4.5,1.4,0.5,0,1.5);
insert into PlayerInfo values ('Tony','Snell','MIL',80,29.2,8.5,3.1,6.8,1.8,4.4,0.6,0.7,0.3,2.8,1.2,0.7,0.7,0.2,1.6);
insert into PlayerInfo values ('Treveon','Graham','CHA',27,7,2.1,0.7,1.5,0.3,0.6,0.4,0.6,0.2,0.6,0.2,0.1,0.2,0,0.7);
insert into PlayerInfo values ('Trevor','Ariza','HOU',80,34.7,11.7,4.1,10,2.4,6.9,1.2,1.6,0.7,5.1,2.2,0.9,1.8,0.3,1.7);
insert into PlayerInfo values ('Trevor','Booker','BKN',70,24.8,10,4.3,8.3,0.4,1.1,1,1.5,2,6,1.9,1.8,1.1,0.4,2.1);
insert into PlayerInfo values ('Trey','Burke','WAS',57,12.3,5,2,4.5,0.5,1.2,0.4,0.5,0.1,0.7,1.8,0.8,0.2,0.1,0.9);
insert into PlayerInfo values ('Trey','Lyles','UTA',71,16.3,6.2,2.2,6.2,0.9,2.9,0.8,1.1,0.7,2.6,1,0.9,0.4,0.3,1.4);
insert into PlayerInfo values ('Tristan','Thompson','CLE',78,30,8.1,3.4,5.6,0,0,1.4,2.7,3.7,5.5,1,0.8,0.5,1.1,2.3);
insert into PlayerInfo values ('Troy','Daniels','MEM',67,17.7,8.2,2.8,7.4,2.1,5.3,0.6,0.8,0.3,1.2,0.7,0.7,0.3,0.1,1.3);
insert into PlayerInfo values ('Troy','Williams','HOU',30,18.6,6.2,2.4,5.6,0.6,2.1,0.7,1.1,0.5,1.8,0.8,1.1,0.9,0.3,2);
insert into PlayerInfo values ('Ty','Lawson','SAC',69,25.1,9.9,3.4,7.6,0.5,1.7,2.5,3.1,0.6,2,4.8,1.9,1.1,0.1,1.7);
insert into PlayerInfo values ('Tyler','Ennis','LAL',53,11.1,4.3,1.7,3.9,0.5,1.3,0.4,0.5,0.2,0.7,1.6,0.8,0.5,0,1.1);
insert into PlayerInfo values ('Tyler','Johnson','MIA',73,29.8,13.7,4.9,11.3,1.3,3.4,2.7,3.5,0.7,3.3,3.2,1.2,1.2,0.6,2.4);
insert into PlayerInfo values ('Tyler','Ulis','PHX',59,18.7,7.3,3,7.2,0.3,1.3,0.9,1.2,0.3,1.2,3.7,1.3,0.8,0.1,1.2);
insert into PlayerInfo values ('Tyler','Zeller','BOS',51,10.3,3.5,1.5,3.1,0,0,0.4,0.8,0.8,1.6,0.8,0.4,0.1,0.4,1.2);
insert into PlayerInfo values ('Tyreke','Evans','SAC',40,19.7,10.3,3.8,9.3,1.1,3,1.7,2.3,0.3,3.1,3.1,1.5,0.9,0.2,1.5);
insert into PlayerInfo values ('Tyson','Chandler','PHX',45,27.3,8.4,3.3,4.9,0,0,1.9,2.6,3.3,8.2,0.6,1.4,0.7,0.5,2.7);
insert into PlayerInfo values ('Tyus','Jones','MIN',60,12.9,3.5,1.3,3,0.4,1.2,0.6,0.7,0.2,1,2.6,0.6,0.8,0.1,0.8);
insert into PlayerInfo values ('Udonis','Haslem','MIA',16,8.1,1.9,0.7,1.4,0,0.2,0.6,0.9,0.5,1.8,0.4,0.5,0.4,0.1,1.4);
insert into PlayerInfo values ('Victor','Oladipo','OKC',67,33.2,15.9,6.1,13.9,1.9,5.3,1.7,2.3,0.6,3.8,2.6,1.8,1.2,0.3,2.3);
insert into PlayerInfo values ('Vince','Carter','MEM',73,24.7,8,2.6,6.7,1.5,4.1,1.2,1.6,0.5,2.6,1.8,0.7,0.8,0.5,2.2);
insert into PlayerInfo values ('Wade','Baldwin IV','MEM',33,12.3,3.2,1.1,3.5,0.1,0.7,0.9,1.1,0.3,1.1,1.8,1.2,0.5,0.2,1.2);
insert into PlayerInfo values ('Wayne','Ellington','MIA',62,24.2,10.5,3.7,9,2.4,6.4,0.6,0.7,0.3,1.8,1.1,0.5,0.6,0.1,1.1);
insert into PlayerInfo values ('Wayne','Selden','MEM',14,16.9,5.1,1.8,4.1,0.5,2,1,1.6,0.1,1.1,0.9,0.9,0.4,0.1,1.3);
insert into PlayerInfo values ('Wesley','Johnson','LAC',68,11.9,2.7,1.1,2.9,0.4,1.7,0.2,0.3,0.4,2.3,0.3,0.3,0.4,0.4,1.2);
insert into PlayerInfo values ('Wesley','Matthews','DAL',72,34.5,13.5,4.6,11.6,2.4,6.6,2,2.5,0.2,3.3,2.9,1.4,1.1,0.2,2.2);
insert into PlayerInfo values ('Will','Barton','DEN',59,28.5,13.7,4.9,11.1,1.5,3.9,2.4,3.2,1,3.4,3.4,1.6,0.8,0.5,1.8);
insert into PlayerInfo values ('Willie','Cauley-Stein','SAC',75,18.9,8.1,3.4,6.4,0,0,1.3,2,1.1,3.4,1.1,0.9,0.7,0.6,2);
insert into PlayerInfo values ('Willie','Reed','MIA',71,14.5,5.3,2.3,4,0,0.1,0.7,1.2,1.8,2.9,0.4,0.4,0.3,0.7,1.9);
insert into PlayerInfo values ('Willy','Hernangomez','NYK',72,18.4,8.2,3.4,6.5,0.1,0.2,1.3,1.7,2.4,4.6,1.3,1.4,0.6,0.5,2.1);
insert into PlayerInfo values ('Wilson','Chandler','DEN',70,30.9,15.7,6.1,13.2,1.5,4.6,2,2.7,1.5,5,2,1.6,0.7,0.4,2.4);
insert into PlayerInfo values ('Yogi','Ferrell','DAL',46,26,10,3.5,8.6,1.5,3.8,1.6,1.9,0.4,2,3.7,1.5,0.9,0.2,2);
insert into PlayerInfo values ('Zach','LaVine','MIN',47,37.2,18.9,6.9,15.1,2.6,6.6,2.5,3,0.4,3,3,1.8,0.9,0.2,2.2);
insert into PlayerInfo values ('Zach','Randolph','MEM',73,24.5,14.1,5.9,13.2,0.3,1.3,1.9,2.6,2.5,5.7,1.7,1.4,0.5,0.1,1.9);
insert into PlayerInfo values ('Zaza','Pachulia','GSW',70,18.1,6.1,2.3,4.4,0,0,1.4,1.8,2,3.9,1.9,1.2,0.8,0.5,2.4);
