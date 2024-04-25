Drop table if exists #TempVehicles
Create table #TempVehicles (
    tRawVehicleAggID int,
    tRawVIN nvarchar(200),
    tRawMake nvarchar(200),
    tRawYear int,
    tRawModel nvarchar(200),
    tRawExteriorColor nvarchar(200),
    tRawInteriorColor nvarchar(200),
    tRawVehicleURL nvarchar(200),
    tVIN nvarchar(200),
    tYear int,
    tMake nvarchar(200),
    tModel nvarchar(200),
    tTrim nvarchar(200),
    tExteriorColor nvarchar(200),
    tInteriorColor nvarchar(200),
    tVehicleURL nvarchar(max)
)


Insert into #TempVehicles
select 
    null,
    VIN, 
    Make, 
    Year,
    Model,
    ExteriorColor,
    InteriorColor,
    CarURL,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
from Raw_Brandon_Honda
group by 
    Make, 
    VIN, 
    Year,
    Model,
    ExteriorColor,
    InteriorColor,
    CarURL
except
select
	null,
	RawMake,
	RawVIN,
	RawYear,
	RawModel,
	RawExteriorColor,
	RawInteriorColor,
	vVehicleURL,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
from Vehicles


Update #TempVehicles
set tMake = trim(tRawMake)


Update #TempVehicles
set tVIN = trim(tRawVIN)


Update #TempVehicles
set tYear = tRawYear


Update #TempVehicles
set tModel = case
	when tRawModel like '%Honda Civic Sedan%'
		then 'Civic Sedan'
	when tRawModel like '%Honda Civic Hatch%'
		then 'Civic Hatchback'
	when tRawModel like '%Honda Civic Si%'
		then 'Civic Si' 
	when tRawModel like '%Honda Civic Type R%'
		then 'Civic Type R' end


Update #TempVehicles
set tTrim = trim(
				substring(
					tRawModel,
					patindex('%Honda Civic Hatchback%',tRawModel)+len('Honda Civic Hatchback'), 
					len(tRawModel) - patindex('%Honda Civic Hatchback%',tRawModel)+len('Honda Civic Hatchback')))
where tRawModel like '%Hatchback%'


Update #TempVehicles
set tTrim = trim(
				substring(
					tRawModel,
					patindex('%Honda Civic Sedan%',tRawModel)+len('Honda Civic Sedan'), 
					len(tRawModel) - patindex('%Honda Civic Sedan%',tRawModel)+len('Honda Civic Sedan')))
where tRawModel like '%Sedan%'


Update #TempVehicles
set tTrim = trim(
				substring(
					tRawModel,
					patindex('%Honda Civic Type R%',tRawModel)+len('Honda Civic Type R'), 
					len(tRawModel) - patindex('%Honda Civic Type R%',tRawModel)+len('Honda Civic Type R')))
where tRawModel like '%Type R%'


Update #TempVehicles
set tTrim = trim(
				substring(
					tRawModel,
					patindex('%Honda Civic Si%',tRawModel)+len('Honda Civic Si'), 
					len(tRawModel) - patindex('%Honda Civic Si%',tRawModel)+len('Honda Civic Si')))
where tRawModel like '%Civic Si%'
Update #TempVehicles
set tExteriorColor = trim(tRawExteriorColor)


Update #TempVehicles
set tExteriorColor = trim(tRawExteriorColor)


Update #TempVehicles
set tInteriorColor = trim(tRawInteriorColor)


Update #TempVehicles
set tVehicleURL = trim(tRawVehicleURL)


Insert into Vehicles
select *
from #TempVehicles

drop table #TempVehicles