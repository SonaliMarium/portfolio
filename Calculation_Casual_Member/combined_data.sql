use case_study
go


select top 10 * from dbo.tr_202106
go



---- Combined data from all months to one single year

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202106
union all 

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202107
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202108
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202109
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202110
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202111
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202112
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202201
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202202
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202203
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202204
union all

select ride_id, rideable_type, start_station_name, started_at, ended_at, member_casual, ride_length, day_of_week, avg_ride_length, Max_Ride_Lenght, mode_day_of_week from dbo.tr_202205

go

