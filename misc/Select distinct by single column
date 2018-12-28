SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() over (partition by EMAIL order by EMAIL) as ROW_NUMBER
    from [USPS_Send]
) as rows
where row_number = 1
