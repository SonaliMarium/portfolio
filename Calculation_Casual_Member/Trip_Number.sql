USE Case_Study
GO

--- Number of trip for all and for each member separately
Select count(*) from [dbo].[trip_202106]	--581791


--- Number of trip for 'Member'
Select count(*) from dbo.trip_202106
where member_casual = 'member'

--- Number of trip for 'casual'
Select count(*) from dbo.trip_202106
where member_casual = 'casual'



--- 
 
exec sp_MSforeachtable 

@precommand = 'DROP TABLE IF EXISTS  ##All_TripNumber
CREATE TABLE ##All_TripNumber 
		(TableName varchar(128) NOT NULL, 
		User_Type varchar(100),
		Total_Ride_Number int,
		)'

,@command1='INSERT INTO ##All_TripNumber (TableName, User_Type, Total_Ride_Number)
		SELECT ''?'' TableName, member_casual, count(*) FROM ?
		group by member_casual'

,@postcommand = 'SELECT * from ##All_TripNumber
where User_Type = "casual"
order by TableName'


----------------

/**
SELECT * FROM INFORMATION_SCHEMA.TABLES 


EXEC sp_MSforeachtable 

'SELECT ''?'' TableName, Count(1) NumRecords FROM ?'

**/