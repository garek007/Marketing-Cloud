select JobID, count(distinct SubscriberKey) as Unsubscribes
from _Unsubscribe with (NOLOCK)
where JobID in (
    select JobID
    from [Newsletter KPI Past month])
group by JobID
