
--- Deleting rows if ride lenght is less than 3 mins or more than 1 Day
--- I have selected rows first separately to cross check actual rows and then delete them

-- Select rows only with ride lenght less than 3 mins
select ride_id, rideable_type, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.trip_202107
where Ride_Length < 0.002083333 --3 Mins
order by Ride_Length desc-- 31165


-- Select rows only with ride lenght more or equal to 1 Days
select ride_id, rideable_type, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.trip_202107
where Ride_Length > 1.00 --(1 Day)
order by Ride_Length desc-- 194


select ride_id, rideable_type, started_at, ended_at, cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length from dbo.trip_202107
where Ride_Length < 0.002083333 or 
Ride_Length > 1.00 
order by Ride_Length desc-- 31359

--- Deleting rows where ride length is less than 3 mins and more than 1 day
delete from dbo.trip_202107
where Ride_Length < 0.002083333 or 
Ride_Length > 1.00 



