

--- Deleting rows if there are null value for start station name/ID or end station name/ID or null value in both

---Select from table to check we are deleting all the nulls

 select * from dbo.trip_202204
 where 
 end_station_name is Null
 and
 end_station_id is Null


 --end_station_name is Null
 --and
 --end_station_id is Null


 ---- After checking and confirming, deleting the rows

delete from dbo.trip_202204
 where 
 end_station_name is Null
 and
 end_station_id is Null

 --or 
 --end_station_name is Null
 --or
 --end_station_id is Null


 ------------- Check for distinct ride IDs to make sure we don't have more same record more than once


 Select count (ride_id) as Ride_ID from dbo.trip_202106


 Select distinct count (ride_id) Distinct_Ride_ID from dbo.trip_202106


 ----------- 
