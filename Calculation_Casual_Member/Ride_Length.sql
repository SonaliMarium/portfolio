

select top 10 * from dbo.tr_202201


select ride_id, rideable_type, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.tr_202201
order by Ride_Length Desc

------- Ride length for all kind users
select ride_id, rideable_type, started_at, ended_at, ride_lenght, start_station_name,member_casual from dbo.trip_202106


--- Ride lenght for casual riders
select ride_id, rideable_type, started_at, ended_at, ride_lenght, start_station_name,member_casual from dbo.trip_202106
where member_casual = 'casual'

--- Ride lenght for member riders
select ride_id, rideable_type, started_at, ended_at, ride_lenght, start_station_name,member_casual from dbo.trip_202106
where member_casual = 'member'

