select JobID, count(*) as Sent
from _Sent with (NOLOCK)
where JobID in (
    select JobID
    from [Newsletter KPI Past month])
group by JobID
