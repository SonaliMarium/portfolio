


--- Add Ride_Length Column in the table


ALTER TABLE dbo.trip_202106 ADD Ride_Length AS cast((ended_at - started_at) as float);


ALTER TABLE dbo.trip_202106 drop column Ride_Length 


select top 1 cast((ended_at - started_at) as float)  as Cal_Ride_Length, Ride_Length,* from dbo.trip_202205

