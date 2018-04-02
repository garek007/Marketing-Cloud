select t.JobID, case when count(t.JobID) > 0 then max(t.Sent) - count(c.JobID) else max(t.Sent) end as Delivered, count(*) as Bounces
from [Newsletter KPI Past month] t with (NOLOCK)
left join [ContentBounces] c on t.JobID = c.JobID
group by t.JobID
