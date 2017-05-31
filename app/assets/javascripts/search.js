$(document).ready(function () {
   $('.search_form').submit(function () {
       var start_station;
       var end_station;

       start_station = $(this).find('#stations_start_station_id');
       end_station = $(this).find('#stations_end_station_id');

       if (start_station.val() == end_station.val()) {
           alert('Choose end station!');
           return false;
       }
   })
});