SELECT s.TriggeredSendCustomerKey,
COUNT(s.TriggeredSendCustomerKey ) as TotalClicks
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s with (NOLOCK)
JOIN _Click o with (NOLOCK)
ON s.SubscriberKey = o.SubscriberKey
WHERE o.TriggeredSendCustomerKey = s.TriggeredSendCustomerKey
AND o.BatchID = s.BatchID
GROUP BY s.TriggeredSendCustomerKey