
--- Finding average ride lenght for all rider type combinedly

select Avg(cast((ended_at - started_at) as float))  as Average_Ride_Length from dbo.trip_202201 


--- Finding average ride lenght for 'Casual' rider type

select member_casual as Member_Type, Avg(cast((ended_at - started_at) as float))  as Average_Ride_Length from dbo.trip_202201
where member_casual = 'casual'
group by member_casual


--- Finding average ride lenght for 'Member' rider type

select member_casual as Member_Type, Avg(cast((ended_at - started_at) as float))  as Average_Ride_Length from dbo.trip_202201
where member_casual = 'member'
group by member_casual





select ride_id, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.tr_202201  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Ride_Length Desc



select ride_id, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, 
Cast(Cast(Ride_Length as datetime) as float) as Ride_Length from dbo.trip_202201  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Cal_Ride_Length Desc


select ride_id, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, 
Ride_Length as Ride_Length from dbo.trip_202201  -- (ended_at - started_at) as Ride_Length from dbo.tr_202106
order by Cal_Ride_Length Desc