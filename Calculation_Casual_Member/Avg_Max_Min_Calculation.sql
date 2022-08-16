
use Case_Study
go

--- In this query, i will run Avg, Max, Min
--- Calculate Average/Mean Ride Length


Select AVG(Ride_Length) as Avg_Ride_Length from dbo.trip_202106
where member_casual = 'casual'

Select member_casual, AVG(Ride_Length) as Avg_Ride_Length from dbo.trip_202106
group by member_casual



--- Run query in all table
EXEC sp_MSforeachtable 

@precommand = 
'DROP TABLE IF EXISTS  ##MaxAvgMode 

CREATE TABLE ##MaxAvgMode
(
TableName varchar(128) NOT NULL,
User_Type varchar(100),
Avg_Ride_Length float,
)'

,@command1='INSERT INTO ##MaxAvgMode (TableName, User_Type, Avg_Ride_Length)
select ''?'' as Table_Name,  member_casual, Avg(Ride_Length) as Avg_Ride_Length FROM ?
group by member_casual'
 
,@postcommand = 'SELECT * FROM ##MaxAvgMode
order by User_Type, TableName'

