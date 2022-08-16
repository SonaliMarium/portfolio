use Case_Study
go


 Select count (*) from dbo.trip_202108
 where member_casual = 'casual'

 -- 804352


 ---Select Most used Station based on trip/ride count
 Select top 10 * from dbo.trip_202108

 select Start_station_name, count(start_station_name) as Trip_Count from dbo.trip_202108 
 group by start_station_name
 order by Trip_Count Desc
 --- Streeter Dr & Grand Ave	13729


select Start_station_name, count(start_station_name) as Trip_Count from dbo.trip_202108 
where member_casual = 'casual'
group by start_station_name
order by Trip_Count Desc
-- Streeter Dr & Grand Ave	11072


select Start_station_name, member_casual, count(start_station_name) as Trip_Count from dbo.trip_202108 
group by member_casual, start_station_name
order by Trip_Count Desc
-- 2112 W Peterson Ave -- (35 + 74)


EXEC sp_MSforeachtable 

@precommand = 
'DROP TABLE IF EXISTS  ##StationStatistics 

CREATE TABLE ##StationStatistics 
(
TableName varchar(128) NOT NULL,
Station_Name varchar(255), 
Trip_Count int,
)'

,@command1='INSERT INTO ##StationStatistics (TableName, Station_Name, Trip_Count)
SELECT top 1 ''?'' TableName,Start_station_name, count(start_station_name) as Trip_Count from ?
 where member_casual = "member"
 group by start_station_name
 order by Trip_Count Desc'
 
,@postcommand = 'SELECT * FROM ##StationStatistics'



