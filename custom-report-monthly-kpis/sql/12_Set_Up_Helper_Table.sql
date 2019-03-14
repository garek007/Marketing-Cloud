SELECT t1.*, mc.Market, mc.Category FROM (
    SELECT EmailName as Email,Sent,Delivered,JobID,SchedTime as "Date Sent",
    UniqueOpens as "Unique Opens",
    UniqueClicks as "Unique Clicks",
    Unsubscribes as "Opt-Outs",
    Year,Month
    FROM [03_Non_Triggered_Sends_Last_Month] nts
    UNION ALL
    SELECT EmailName as Email,Sent,Delivered,JobID,SchedTime as "Date Sent",
    UniqueOpens as "Unique Opens",
    UniqueClicks as "Unique Clicks",
    Unsubscribes as "Opt-Outs",
    Year,Month
    FROM [04_Triggered_Sends_Last_Month] ts
) t1
JOIN (
    SELECT JobID, Market, Category
    FROM [DeploymentDetails]
    WHERE JobID IN (
        SELECT JobID FROM [03_Non_Triggered_Sends_Last_Month]
        UNION ALL
        SELECT JobID FROM [04_Triggered_Sends_Last_Month]
        
    )
    AND Market IS NOT NULL 
    AND Market <> 'unknown'
) mc
ON t1.JobID = mc.JobID