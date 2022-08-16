Use Case_Study
go

select rideable_type, member_casual, COUNT(rideable_type) as Bike_Trip_Count
FROM dbo.trip_202111
GROUP BY rideable_type, member_casual
ORDER BY COUNT(rideable_type) Desc
go


--select top 1 rideable_type, COUNT(rideable_type) as Bike_Trip_Count
--FROM dbo.tr_202203
--GROUP BY rideable_type
--ORDER BY COUNT(rideable_type) Desc
--go

select top 1 rideable_type, member_casual, COUNT(rideable_type) as Bike_Trip_Count
FROM dbo.trip_202111
where member_casual = 'member'
GROUP BY rideable_type, member_casual
ORDER BY COUNT(rideable_type) Desc
go


--
select member_casual, rideable_type, * from dbo.trip_202111
where member_casual = 'member'
and rideable_type = 'docked_bike'
go



--- Run query in all table
EXEC sp_MSforeachtable 

@precommand = 
'DROP TABLE IF EXISTS  ##TopBikeType 

CREATE TABLE ##TopBikeType
(
TableName varchar(128) NOT NULL,
User_Type varchar(100),
Bike_Type varchar(100),
Trip_Count float,
)'

,@command1='INSERT INTO ##TopBikeType (TableName, Bike_Type, User_Type, Trip_Count)
select top 1 ''?'' as Table_Name,  rideable_type, member_casual, COUNT(rideable_type) as Bike_Trip_Coount FROM ?
where member_casual = "casual"
group by rideable_type, member_casual
ORDER BY COUNT(rideable_type) Desc'
 
,@postcommand = 'SELECT * FROM ##TopBikeType
order by TableName'

