SELECT linkrank.*, kpi.EmailSubject,kpi.Sent,kpi.Delivered,kpi.TotalOpens,kpi.UniqueOpens,kpi.TotalClicks,
kpi.UniqueClicks,kpi.market,
kpi.Unsubscribes,
	CASE WHEN CHARINDEX('_',LinkName) > 1 THEN
		substring(LinkName,1,CHARINDEX('_',LinkName)-1) 
	END as LinkCategory,
	CASE WHEN CHARINDEX('_',LinkName,CHARINDEX('_',LinkName)+1)>1 THEN
		substring(LinkName,CHARINDEX('_',LinkName)+1, CHARINDEX('_',LinkName,CHARINDEX('_',LinkName)+1)-CHARINDEX('_',LinkName,CHARINDEX('_',LinkName))-1 ) 
	END as LinkSubCategory,
CHARINDEX('_',LinkName,CHARINDEX('_',LinkName))  as Pos1,
CHARINDEX('_',LinkName,CHARINDEX('_',LinkName)+1) as Pos2,
CHARINDEX('_',LinkName,    36   ) as Pos3
FROM [Newsletter Link Ranking Past month] linkrank

JOIN [Newsletter KPI Past month] kpi
on linkrank.JobID = kpi.JobID
