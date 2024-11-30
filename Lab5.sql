create table FLIGHT(Flight_number varchar(20), Departure_time varchar(20) , Arrival_time varchar(20)
, Departure_town varchar(20), Arrival_town varchar(20)); 

Declare
v_flight flight%ROWTYPE;
begin
v_flight.Flight_number := 'AF110';
v_flight.Departure_time := '9.40 p.m';
v_flight.Arrival_time := '11.10 p.m';
v_flight.Departure_town := 'Paris';
v_flight.Arrival_town := 'Dubai';
Insert Into Flight values(v_flight);
end;

