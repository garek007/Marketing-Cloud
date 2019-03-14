SELECT
j.JobID,
CASE WHEN count(b.JobID) > 0
THEN max(j.Sent) - count(b.JobID)
ELSE max(j.Sent) END as Delivered,
COUNT(b.JobID) as Bounced
FROM [03_Non_Triggered_Sends_Last_Month] j
LEFT JOIN [02_Bounces_Last_Month_BDV] b
ON j.JobID = b.JobID
GROUP BY j.JobID