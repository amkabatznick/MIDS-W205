drop table my_hospitals;

create table my_hospitals as
Select
    cast(provider_id as int) provider_id,
    cast(hospital_name as varchar(52)) hospital_name,
    cast(address as VARCHAR(46)) address,
    cast(city as VARCHAR(22)) city,
    cast(state as VARCHAR(4)) state,
    cast(zip_code as int) zip_code,
    cast(county_name as VARCHAR(22)) county_name,
    cast(phone_number as varchar(12)) phone_number,
    cast(hospital_type as varchar(38)) hospital_type,
    cast(hospital_ownership as varchar(45)) as hospital_ownership,
    cast(emergency_services  as varchar(5)) as emergency_services
from hospitals;
