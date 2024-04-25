Drop table if exists #TempStore
Create table #TempStore (
    tRawStoreName nvarchar(200),
    tRawStoreAddress1 nvarchar(200),
    tRawStoreAddress2 nvarchar(200),
    tDealershipName nvarchar(200),
    tAddressLine nvarchar(200),
    tCity nvarchar(200),
    tState nvarchar(200),
    tZipcode int,
    tDealershipURL nvarchar(max)
)


Insert into #TempStore
select 
    StoreName, 
    StoreAddress1, 
    StoreAddress2,
    null,
    null,
    null,
    null,
    null,
    trim(substring(CarURL,1,patindex('%.com%',CarURL)+4))
from Raw_Brandon_Honda
group by StoreName, StoreAddress1, StoreAddress2, trim(substring(CarURL,1,patindex('%.com%',CarURL)+4))
except 
select 
   RawStoreName,
   RawStoreAddress1,
   RawStoreAddress2,
    null,
    null,
    null,
    null,
    null,
	dDealershipURL
from Dealerships


Update #TempStore
set tDealershipName = trim(tRawStoreName)


Update #TempStore
set tAddressLine = trim(tRawStoreAddress1)


Update #TempStore
set tCity = trim(
		substring(
			tRawStoreAddress2,
			1, 
			charindex(',',tRawStoreAddress2)-1))


Update #TempStore
set tState = trim(
		substring(
			tRawStoreAddress2, 
			charindex(',',tRawStoreAddress2)+1,
			3))


Update #TempStore
set tZipcode = trim(
		substring(
			tRawStoreAddress2, 
			patindex('% [0-9][0-9][0-9][0-9][0-9]',tRawStoreAddress2)+1,
			5))


Update #TempStore
set tDealershipURL = tDealershipURL



Insert into Dealerships
select *
from #TempStore

drop table #TempStore
