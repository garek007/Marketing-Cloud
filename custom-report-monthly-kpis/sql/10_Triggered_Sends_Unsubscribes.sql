SELECT s.TriggeredSendCustomerKey, COUNT(s.TriggeredSendCustomerKey) as Unsubscribes
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s
JOIN (
    SELECT SubscriberID
    FROM _Unsubscribe
    WHERE IsUnique = 1
    AND JobID IN (
        SELECT JobID FROM [04_Triggered_Sends_Last_Month]
    )
) u
ON s.SubscriberID = u.SubscriberID
WHERE s.TriggeredSendCustomerKey is not null
GROUP BY s.TriggeredSendCustomerKey