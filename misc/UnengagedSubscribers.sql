SELECT *
FROM _Subscribers
WHERE EmailAddress NOT IN (
    SELECT
    EmailAddress
    FROM _Open
    WHERE EventDate >= DATEADD(mm,DATEDIFF(mm,0,GETDATE())-6,0)
    /*AND EventDate < DATEADD(mm,DATEDIFF(mm,0,GETDATE()),0)*/
)