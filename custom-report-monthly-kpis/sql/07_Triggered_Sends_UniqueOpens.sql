SELECT s.TriggeredSendCustomerKey,
COUNT(s.TriggeredSendCustomerKey ) as UniqueOpens
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s with (NOLOCK)
JOIN _Open o with (NOLOCK)
ON s.SubscriberID = o.SubscriberID
WHERE s.TriggeredSendCustomerKey = o.TriggeredSendCustomerKey
AND o.IsUnique = 1
and s.batchid = o.batchid
GROUP BY s.TriggeredSendCustomerKey