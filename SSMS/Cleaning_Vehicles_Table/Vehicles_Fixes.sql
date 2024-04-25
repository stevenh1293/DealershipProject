--Si comes as sedan only
update Vehicles
set vTrim = 'Si'
where vModel like '%Civic Si%' 

update Vehicles
set vModel = 'Civic Sedan'
where vModel like '%Civic Si%' 

--Type R comes as hatchback only
update Vehicles
set vTrim = 'Type R'
where vModel like '%Type R%' 

update Vehicles
set vModel = 'Civic Hatchback'
where vModel like '%Type R%'
