SELECT s.SubscriberKey,s.SubscriberID,j.EmailName,s.JobID,s.ListID,s.BatchID,s.TriggeredSendCustomerKey,s.Domain,s.EventDate,CONVERT(VARCHAR(7),s.EventDate,111) as YearMonth
FROM _Sent s
JOIN _Job j
ON s.JobID = j.JobID
WHERE EventDate >= DATEADD(mm,DATEDIFF(mm,0,GETDATE())-1,0)
AND EventDate < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)
AND SuppressTracking <> 1
