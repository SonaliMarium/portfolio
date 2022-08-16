Use Case_Study
go


select count(*) from dbo.tr_202106 -- This query is for cross examin the result
where member_casual = 'casual'
--order by rideable_type
go


--- Calculating popular bike type for each rider type based on trip/ride count

--- Counting Trip numbers for each bike type
select rideable_type, COUNT(rideable_type) as Bike_Type_Count
FROM dbo.tr_202106
GROUP BY rideable_type
--ORDER BY COUNT(rideable_type) 
go

--- Grouping Bike type for members and counted bike type used by members
select '2021_June' as Months, rideable_type, member_casual, COUNT(rideable_type) as Bike_Type_Count
FROM dbo.tr_202106
GROUP BY rideable_type, member_casual
--ORDER BY COUNT(rideable_type) 
go


--- Calculating popular bike type for each rider type based on ride length
select '2021_June' as Months, rideable_type, member_casual, sum(cast((ended_at - started_at) as float)) as Total_Ride_Length
FROM dbo.trip_202106
GROUP BY rideable_type, member_casual


--
select member_casual, rideable_type, * from dbo.tr_202106
where member_casual = 'member'
and rideable_type = 'docked_bike'
go



--- Run query in all tables for highest numbers of trip taken by which bike type in every month 
EXEC sp_MSforeachtable --- 

@precommand = 
'DROP TABLE IF EXISTS  ##TripStatistics 

CREATE TABLE ##TripStatistics 
(
TableName varchar(128) NOT NULL,
User_Type varchar(255),
Ride_Type varchar(255),
Trip_Count int,
)'

,@command1='INSERT INTO ##TripStatistics (TableName, User_Type, Ride_Type, Trip_Count)
select ''?'' as Table_Name, member_casual, rideable_type, COUNT(rideable_type) as Bike_Type_Count
FROM ?
GROUP BY rideable_type, member_casual
ORDER BY COUNT(rideable_type) Desc'
 
,@postcommand = 'SELECT * FROM ##TripStatistics
order by TableName'



----------


--- Run query in all tables for Total number of trip taken by each rider type with each bike type in every month 
EXEC sp_MSforeachtable --- 

@precommand = 
'DROP TABLE IF EXISTS  ##TripStatistics 

CREATE TABLE ##TripStatistics 
(
TableName varchar(128) NOT NULL,
User_Type varchar(255),
Ride_Type varchar(255),
Ride_Length float,
Trip_Count int,
)'

,@command1='INSERT INTO ##TripStatistics (TableName, User_Type, Ride_Type,Trip_Count, Ride_Length)
select ''?'' as Table_Name, member_casual, rideable_type, COUNT(rideable_type) as Bike_Type_Count, sum(cast((ended_at - started_at) as float)) as Total_Ride_Length
FROM ?
GROUP BY rideable_type, member_casual
ORDER BY COUNT(rideable_type) Desc'
 
,@postcommand = 'SELECT * FROM ##TripStatistics
order by TableName'