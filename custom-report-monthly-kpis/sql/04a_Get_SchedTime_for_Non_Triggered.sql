SELECT JobID, SchedTime
FROM _Job
WHERE JobID IN (
    SELECT JobID FROM [03_Non_Triggered_Sends_Last_Month]
)