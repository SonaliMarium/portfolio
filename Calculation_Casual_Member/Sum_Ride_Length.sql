use Case_Study
go

--- Sum of total ride length for all members collectively and indidually

--select SUM(Ride_Length) as Sum_Ride_Lenght from dbo.trip_202106


select member_casual, SUM(Ride_Length) as Sum_Ride_Lenght from dbo.trip_202106
group by member_casual


--- Run in all the table
EXEC sp_MSforeachtable 

@precommand = 
'DROP TABLE IF EXISTS  ##RideLengthSum 

CREATE TABLE ##RideLengthSum 
(
TableName varchar(128) NOT NULL,
User_Type varchar(100),
Total_Ride_Length float,
)'

,@command1='INSERT INTO ##RideLengthSum (TableName, User_Type, Total_Ride_Length)
select ''?'' as Table_Name, member_casual, SUM(Ride_Length) as Sum_Ride_Lenght FROM ?
group by member_casual'
 
,@postcommand = 'SELECT * FROM ##RideLengthSum
order by User_Type, TableName'

--where User_Type = "member"'



select top 1 * from dbo.trip_202106
