use NBARegularSeason1617;

/* 
	create the view PlayerInfo_percentage: [FG%], [3P%], [FT%], and REB.
	create the view TeamScore_percentage
	

	Round() Function: 
		The ROUND() function returns a number rounded to a certain number of decimal places. 
		EX: Round(34.55, 1) 

	NULLIF() Function:
		Avoid division by zero. 
		Return Null
		Select dividend / nullif(divisor, 0)


*/

create view PlayerInfo_percentage
as
	select PlayerID, PlayerFName, PlayerLname, TeamID, GP, Min, PTS, 
		FGM, FGA, cast(FGM / nullif(FGA,0)* 100 as decimal(5,2)) as [FG%],
		[3PM],[3PA], cast([3PM]/nullif([3PA],0)*100 as decimal(5,2)) as [3P%],
		FTM, FTA, cast(FTM/nullif(FTA,0)*100 as decimal(5,2)) as [FT%],
		OREB, DREB, OREB + DREB as REB,
		AST, TOV, STL, BLK, PF
	from PlayerInfo
go

create view TeamScore_percentage
as
	select TeamID, GP, 
		W, L, cast((W/(W+L)*100) as decimal(5,2)) as [W%],
		Min, PTS,
		FGM, FGA, cast(FGM/FGA*100 as decimal(5,2)) as [FG%],
		[3PM], [3PA], cast([3PM]/[3PA]*100 as decimal(5,2)) as [3P%],
		FTM, FTA, cast(FTM/FTA*100 as decimal(5,2)) as [FT%],
		OREB, DREB, OREB + DREB as REB,
		AST, TOV, STL,
		BLK, BLKA, cast(BLK/BLKA*100 as decimal(5,2)) as [BLK%],
		PF
	from TeamScore
go

select * from PlayerInfo_percentage;
select * from TeamScore_percentage;

drop view PlayerInfo_percentage;
drop view TeamScore_percentage;
