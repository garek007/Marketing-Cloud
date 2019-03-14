SELECT
j.TriggeredSendCustomerKey,
CASE WHEN count(b.TriggeredSendCustomerKey) > 0
THEN max(j.Sent) - count(b.TriggeredSendCustomerKey)
ELSE max(j.Sent) END as Delivered,
COUNT(b.TriggeredSendCustomerKey) as Bounced
FROM [04_Triggered_Sends_Last_Month] j
LEFT JOIN [02_Bounces_Last_Month_BDV] b
ON j.TriggeredSendCustomerKey = b.TriggeredSendCustomerKey
GROUP BY j.TriggeredSendCustomerKey