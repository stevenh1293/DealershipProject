--Aggregate duplicate vehicles to AggID col
update a
set vVehicleIDAgg = b.AggID
from Vehicles a
join (
	select vVIN, min(vVehicleID) as AggID
	from Vehicles
	group by vVIN
	) b
	on a.vVIN = b.vVIN
where a.vVehicleIDAgg is null