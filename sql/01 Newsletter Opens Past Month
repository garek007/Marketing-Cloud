SELECT s.JobID, s.EmailName, s.EmailSubject, count(o.SubscriberKey) as TotalOpens, count(case when isUnique = 1 then 1 else null end) as UniqueOpens
FROM _Open o
JOIN (
        select JobID, EmailName, EmailSubject
        from _Job 
        where EmailName NOT LIKE '%[_]welcome[_]%'
        and (EmailName LIKE 'Newsletter[_]%')
        AND DeliveredTime >= DATEADD(mm,DATEDIFF(mm,0,GETDATE())-1,0)
        AND DeliveredTime < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)
        and SuppressTracking = 0
        and AccountUserID not in (7232964)
        )s
on o.JobID = s.JobID
group by s.JobID,s.EmailName,s.EmailSubject
having count(o.SubscriberKey) > 165
