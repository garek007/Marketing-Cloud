SELECT s.TriggeredSendCustomerKey,
COUNT(s.TriggeredSendCustomerKey ) as TotalOpens
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s with (NOLOCK)
JOIN _Open o with (NOLOCK)
ON s.SubscriberID = o.SubscriberID
AND s.TriggeredSendCustomerKey = o.TriggeredSendCustomerKey
and s.batchid = o.batchid
GROUP BY s.TriggeredSendCustomerKey