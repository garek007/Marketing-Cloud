select JobID, count(*) as TotalClicks, count(case when isUnique = 1 then 1 else null end) as UniqueClicks
from _Click with (NOLOCK)
where JobID in (
    select JobID
    from [Newsletter KPI Past month])
group by JobID
