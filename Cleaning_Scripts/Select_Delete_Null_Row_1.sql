

select top 10 * from [dbo].[tr_202106]



 select * from dbo.trip_202106
 where start_station_name is Null
 or
 start_station_id is Null
 or 
 end_station_name is Null
 or
 end_station_id is Null



delete from dbo.trip_202106
 where start_station_name is Null
 or
 start_station_id is Null
 or 
 end_station_name is Null
 or
 end_station_id is Null


select datepart(weekday, started_at) as Day_Of_Week from [dbo].[trip_202107]


select * from [dbo].[trip_202107]
where ride_lenght in (select max(ride_lenght) as max_ride_length from [dbo].[trip_202107])


select cast(cast(avg(cast(CAST(ride_lenght as datetime) as float)) as datetime) as time) as avg_ride_length from [dbo].[trip_202106]


-------------------





select Avg_Ride_Length, * from dbo.tr_202106
where Avg_Ride_Length is Null

go


select started_at, ended_at, (ended_at - started_at) as Cal_Ride_Length from dbo.tr_202106


select cast(cast(avg(cast(CAST(Ride_Length as datetime) as float)) as datetime) as time) as avg_ride_length from [dbo].[tr_202106]



select ride_id, started_at, ended_at, cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Cal_Ride_Length, Ride_Length from dbo.tr_202106  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc



select cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Ride_Length from [dbo].[tr_202106]


select started_at, ended_at, cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Cal_Ride_Length, cast(cast(cast(CAST(Ride_Length as datetime) as float) as datetime) as time) as Reg_Ride_Length from dbo.tr_202106
order by Reg_Ride_Length Desc


select top 10 * from dbo.tr_202106

select member_casual, sum(Ride_Length) as Sum_Ride_Length from dbo.tr_202106
group by member_casual

--F043F0F6A1AA4F85



select ride_id, started_at, ended_at, (ended_at - started_at) as Cal_Ride_Length, Ride_Length from dbo.tr_202106  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc


select cast(cast(avg(cast(CAST(Ride_Length as datetime) as float)) as datetime) as time) as avg_ride_length from [dbo].[tr_202201]


select ride_id, started_at, ended_at, format((ended_at - started_at), 'D:HH:MM:ss')  as Cal_Ride_Length, Ride_Length from dbo.tr_202106  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc



select ride_id, started_at, ended_at, (DateDiff(SECOND, started_at, ended_at))  as Cal_Ride_Length, Ride_Length from dbo.tr_202106  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc


select ride_id, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.tr_202201  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc

select * from dbo.tr_202201 
order by Ride_Length Desc


select AVG(ride_Length) as Average_Ride_Length from dbo.tr_202201



select datename(weekday, started_at) as Day_Of_Week from [dbo].[trip_202107]
