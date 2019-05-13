SELECT *
FROM _Subscribers
WHERE SubscriberKey NOT IN (
    SELECT
    SubscriberKey
    FROM _Open
    WHERE EventDate >= DATEADD(dd,DATEDIFF(dd,0,GETDATE())-30,0)
    /*AND EventDate < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)*/
)