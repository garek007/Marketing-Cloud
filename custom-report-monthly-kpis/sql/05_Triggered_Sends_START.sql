/* This starts the triggered sends table and gets TriggeredSendCustomerKey and Counts Sent*/
SELECT s.JobID,s.TriggeredSendCustomerKey,s.EmailName,s.YearMonth,
SUBSTRING(s.YearMonth,1,CHARINDEX('/',s.YearMonth)-1) as Year,
COUNT (s.TriggeredSendCustomerKey) as Sent,
DATENAME(Month,s.EventDate) as Month
FROM [01_Individual_Emails_Sent_Last_Month_SDV] s
WHERE s.TriggeredSendCustomerKey is not null
GROUP BY s.TriggeredSendCustomerKey,s.EmailName,s.YearMonth,s.JobID,DATENAME(Month,s.EventDate)