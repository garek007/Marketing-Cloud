SELECT
s.JobID,s2.Sent,s.EmailName,s.EventDate,s.TriggeredSendCustomerKey,s.YearMonth,SUBSTRING(s.YearMonth,1,CHARINDEX('/',s.YearMonth)-1) as Year,DATENAME(Month,s.EventDate) as Month,
(SELECT count(o.JobID) FROM _Open o WHERE o.JobID = s.JobID) as TotalOpens,
(SELECT count(o.JobID) FROM _Open o WHERE o.JobID = s.JobID AND o.IsUnique = 1) as UniqueOpens,
(SELECT count(c.JobID) FROM _Click c WHERE c.JobID = s.JobID) as TotalClicks,
(SELECT count(c.JobID) FROM _Click c WHERE c.JobID = s.JobID AND c.IsUnique = 1) as UniqueClicks,
(SELECT count(u.JobID) FROM _Unsubscribe u WHERE u.JobID = s.JobID AND u.EventDate >= DATEADD(mm,DATEDIFF(mm,0,GETDATE())-1,0) AND u.EventDate < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0) AND IsUnique = 1) as Unsubscribes
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s with (NOLOCK)
JOIN (
    SELECT JobID,count(SubscriberKey) as Sent
    FROM [01_Individual_Emails_Sent_Last_Month_SDV]
    /*
    WHERE EventDate >= DATEADD(mm,DATEDIFF(mm,0,GETDATE())-1,0)
    AND EventDate < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)  */
    GROUP BY JobID
    ) s2
ON s.JobID = s2.JobID
WHERE s.TriggeredSendCustomerKey is null /* Only get manual sends */