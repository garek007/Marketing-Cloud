SELECT JobID,
CASE WHEN EmailName LIKE 'Newsletter_unk%' THEN
    'United Kingdom' 
    WHEN EmailName LIKE 'Newsletter_can%' THEN
    'Canada' 
    WHEN EmailName LIKE 'Newsletter_col%' THEN
    'Colombia' 
    WHEN EmailName LIKE 'Newsletter_dom%' THEN
    'Domestic' 
    WHEN EmailName LIKE 'Newsletter_fla%' THEN
    'Florida' 
    WHEN EmailName LIKE 'Newsletter_gle%' THEN
    'Global English' 
    WHEN EmailName LIKE 'Newsletter_mex%' THEN
    'Mexico' 
    WHEN EmailName LIKE 'Newsletter_bra%' THEN
    'Brazil'
    WHEN EmailName LIKE 'Newsletter_gls%' THEN
    'Global Spanish' 
    WHEN EmailName LIKE 'Newsletter_ire%' THEN
    'Ireland' 
    END as market
FROM [Newsletter KPI Past month]
