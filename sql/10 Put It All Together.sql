SELECT lr.JobID,lr.EmailName,lr.LinkContent,lr.LinkCategory,lr.LinkSubcategory,lr.LinkUniqueClicks,
lr.LinkTotalClicks,lr.LinkName,
kpi.EmailSubject,kpi.Sent,kpi.Delivered,kpi.TotalOpens,kpi.UniqueOpens,kpi.TotalClicks,
kpi.UniqueClicks,kpi.market,kpi.Unsubscribes,
Case 
  WHEN CHARINDEX('_',lr.LinkPosition) > 1  THEN
    substring(LinkPosition,CHARINDEX('_',LinkPosition)+1,LEN(LinkPosition) )
END as LinkHeadline,
Case 
  WHEN CHARINDEX('_',lr.LinkPosition) > 1  THEN
    substring(LinkPosition,1,CHARINDEX('_',LinkPosition)-1 )
  ELSE
    lr.LinkPosition
END as LinkPosition


FROM [Newsletter Click Totals Past month] lr

JOIN [Newsletter KPI Past month] kpi
on lr.JobID = kpi.JobID