SELECT JobID, Market, Category
FROM [DeploymentDetails]
WHERE JobID IN (
    SELECT JobID FROM [05_Monthly_KPI_Report_B2C_HELPER]
)