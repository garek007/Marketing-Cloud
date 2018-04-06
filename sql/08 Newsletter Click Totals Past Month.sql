SELECT JobID,EmailName,LinkContent, LinkName, 
count(LinkContent) as LinkTotalClicks, 
count(distinct SubscriberKey) as LinkUniqueClicks,
LinkCategory,LinkSubcategory,LinkPosition,utmcontent
FROM 
[Newsletter Links Clicked Past Month]
GROUP BY LinkContent, LinkName,JobID,EmailName,LinkCategory,LinkSubcategory,LinkPosition,utmcontent