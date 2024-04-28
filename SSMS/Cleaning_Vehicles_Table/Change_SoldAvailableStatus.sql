--Update vehicles as Available or Sold

drop table if exists #TempDealerMaxDate
create table #TempDealerMaxDate (
	tmDealershipID int,
	tmDate Date
	)

insert into #TempDealerMaxDate
select mDealershipID, max(mDate)
from MainData
group by mDealershipID


drop table if exists #TempVehicleMaxDate
create table #TempVehicleMaxDate (
	tvDealershipID int,
	tvVehicleIDAgg int,
	tvDate Date)


insert into #TempVehicleMaxDate
select mDealershipID, vVehicleIDAgg, max(mDate)
from Vehicles a
join MainData b
	on a.vVehicleID = b.mVehicleID
group by mDealershipID, vVehicleIDAgg


--Remove swapped vehicle from previous dealership
delete a
from #TempVehicleMaxDate a
join (select tvVehicleIDAgg, max(tvDate) as maxDate
	  from #TempVehicleMaxDate
	  group by tvVehicleIDAgg) b
	on a.tvVehicleIDAgg = b.tvVehicleIDAgg
where a.tvDate < b.maxDate


update Vehicles
set vVehicleStatus = case when tvDate <> tmDate then 'Sold' else 'Available' end
from #TempVehicleMaxDate
join #TempDealerMaxDate
	on tmDealershipID = tvDealershipID
join Vehicles
	on tvVehicleIDAgg = vVehicleIDAgg
