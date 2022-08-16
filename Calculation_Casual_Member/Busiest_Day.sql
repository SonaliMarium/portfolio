Use Case_Study
go

Select count(*) as Number_of_Rows from [dbo].[trip_202106] --- This query is to check that our calculation is correct


--- Get Busiest day overall

select datename(weekday, started_at) as Days, count(datename(weekday, started_at)) as Used_Number from [dbo].[trip_202106]
group by datename(weekday, started_at)
order by Used_Number desc


--- Get Busiest day for each type of rider separately

select datename(weekday, started_at) as Days, count(datename(weekday, started_at)) as Used_Number from [dbo].[trip_202106]
where member_casual = 'casual'
group by datename(weekday, started_at)
order by Used_Number desc

select top 1 datename(weekday, started_at) as Days, count(datename(weekday, started_at)) as Used_Number from [dbo].[trip_202106]
where member_casual = 'casual'
group by datename(weekday, started_at)
order by Used_Number desc

--- Run query in all tables
EXEC sp_MSforeachtable 

@precommand = 
'DROP TABLE IF EXISTS  ##Days_Count 

CREATE TABLE ##Days_Count 
(
TableName varchar(128) NOT NULL,
Days varchar(255),
Used_Number int,
)'

,@command1='INSERT INTO ##Days_Count (TableName, Days, Used_Number)
select top 1 ''?'' as Table_Name, datename(weekday, started_at) as Days, count(datename(weekday, started_at)) as Used_Number
FROM ?
where member_casual = "member"
group by datename(weekday, started_at)
order by Used_Number desc'
 
,@postcommand = 'SELECT * FROM ##Days_Count'


