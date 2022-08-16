

select * from [dbo].[trip_202106]


---Select from table to check we are deleting all the nulls

 select * from dbo.trip_202106
 where start_station_name is Null
 or
 start_station_id is Null
 or 
 end_station_name is Null
 or
 end_station_id is Null


 ---- After checking and confirming, deleting the rows

delete from dbo.trip_202106
 where start_station_name is Null
 or
 start_station_id is Null
 or 
 end_station_name is Null
 or
 end_station_id is Null


--- Run the same query in all other tables



select datepart(weekday, started_at) as Day_Of_Week from [dbo].[trip_202107]


select * from [dbo].[trip_202107]
where ride_lenght in (select max(ride_lenght) as max_ride_length from [dbo].[trip_202107])


select cast(cast(avg(cast(CAST(ride_lenght as datetime) as float)) as datetime) as time) as avg_ride_length from [dbo].[trip_202106]


-------------------





select Avg_Ride_Length, * from dbo.tr_202106
where Avg_Ride_Length is not Null

go


select started_at, ended_at, (ended_at - started_at) as Ride_Length from dbo.tr_202106


select cast(cast(avg(cast(CAST(Ride_Length as datetime) as float)) as datetime) as time) as avg_ride_length from [dbo].[tr_202106]



select started_at, ended_at, cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Cal_Ride_Length, Ride_Length from dbo.tr_202106  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Cal_Ride_Length Desc



select cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Ride_Length from [dbo].[tr_202106]


select started_at, ended_at, cast(cast(cast(CAST((ended_at - started_at) as datetime) as float) as datetime) as time) as Cal_Ride_Length, cast(cast(cast(CAST(Ride_Length as datetime) as float) as datetime) as time) as Reg_Ride_Length from dbo.tr_202106
order by Cal_Ride_Length Desc


select top 10 * from dbo.tr_202106