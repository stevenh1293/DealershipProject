Drop table if exists #TempMainData
create table #TempMainData (
	tDate Date,
	tDealershipID int,
	tVehicleID int,
	tMSRP nvarchar(200),
	tDealerPrice nvarchar(200)
	)
	
insert into #TempMainData
select
	ScrapeDate,
	dDealershipID,
	vVehicleID,
	MSRP,
	DealerPrice
from Raw_Brandon_Honda 
join Vehicles 
	on VIN = RawVIN
	and Make = RawMake
	and [Year] = RawYear
	and Model = RawModel
	and ExteriorColor = RawExteriorColor
	and InteriorColor = RawInteriorColor
join Dealerships
	on StoreName = RawStoreName
	and StoreAddress1 = RawStoreAddress1
	and StoreAddress2 = RawStoreAddress2


update #TempMainData
set tDealerPrice = replace(replace(replace(tDealerPrice,'$',''),',',''),'*','')


Insert into MainData
select *
from #TempMainData
except 
select
	mDate,
	mDealershipID,
	mVehicleID,
	mMSRP,
	mDealerPrice
from MainData

drop table #TempMainData