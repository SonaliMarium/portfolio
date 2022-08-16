

select top 10 * from [dbo].[tr_202106]


--- Creating view with columns I will use for more data cleaning

Create View Data_202106 as

Select Ride_ID, Rideable_Type, Started_At, Ended_At, Start_Station_Name, Start_Station_ID, End_Station_Name, End_Station_ID, Member_Casual, Ride_Length from [dbo].[tr_202106]
where
start_station_id is not Null
or
start_station_name is not Null
or
end_station_id is not Null
or
end_station_name is not Null


 -- 4FFD310C6F6D719B , FF317D37C7EE0F11 , 527F40BCE688A4CD -- 649502 with station ID, 

 -----------------------------------------------------------------------------------Dropping NULL Rows----------------------------------------------------------------------------------------------------------
 
 --- Checking If I have data either for start station name or start station id. If I don't have any of these data then I will drop/not use those rows for  
 Select * from Data_202106
 Where 
 (start_station_id is Null
 and
 start_station_name is not Null)
 or
 (start_station_id is not Null
 and
 start_station_name is Null)


  --- Checking If I have data either for end station name or end station id. If I don't have any of these data then I will drop/not use those rows for  
 Select * from Data_202106
 Where 
 (end_station_id is Null
 and
 end_station_name is not Null)
 or
 (end_station_id is not Null
 and
 end_station_name is Null)

 
 --- Select rows only with data and no Null values
  Select * from Data_202106
  where
  (start_station_id is not Null
  and
  start_station_name is not Null)
  or
  (end_station_id is not Null
  and
  end_station_name is not Null)



  --- Select rows only with data and no Null values
  Select * from Data_202106
  where
  (start_station_id is not Null
  or
  start_station_name is not Null)
  or
  (end_station_id is not Null
  or
  end_station_name is not Null)
