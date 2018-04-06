select c.JobID, j.EmailName, LinkContent as FullURL, 
Case WHEN CHARINDEX('?',LinkContent) > 1 THEN
    substring(LinkContent, 1, CHARINDEX('?',LinkContent)-1)
    ELSE
    LinkContent
END as LinkContent,
substring(LinkContent, CHARINDEX('?',LinkContent), LEN(LinkContent)) as LinkContent2,

	Case 
	  WHEN CHARINDEX('utm_content=',LinkContent) > 1  THEN
		Case
		WHEN CHARINDEX('&',LinkContent,CHARINDEX('utm_content=',LinkContent)+12 ) > 1  THEN
			substring(LinkContent, CHARINDEX('utm_content=',LinkContent)+12, CHARINDEX('&',LinkContent,CHARINDEX('utm_content=',LinkContent)+12 )-(CHARINDEX('utm_content=',LinkContent)+12)   )
		ELSE
	    	substring(LinkContent, CHARINDEX('utm_content=',LinkContent)+12, LEN(LinkContent)  ) 
	    END 
      ELSE 'no utm content'
    END as utmcontent,


	Case 
	  WHEN CHARINDEX('vcat=',LinkContent) > 1  THEN
		Case
		WHEN CHARINDEX('&',LinkContent,CHARINDEX('vcat=',LinkContent)+5 ) > 1  THEN
			substring(LinkContent, CHARINDEX('vcat=',LinkContent)+5, CHARINDEX('&',LinkContent,CHARINDEX('vcat=',LinkContent)+5 )-(CHARINDEX('vcat=',LinkContent)+5)   )
		ELSE
	    	substring(LinkContent, CHARINDEX('vcat=',LinkContent)+5, LEN(LinkContent)  ) 
	    END 
      ELSE 'no content category'
    END as LinkCategory,

	Case 
	  WHEN CHARINDEX('vsub=',LinkContent) > 1  THEN
		Case
		WHEN CHARINDEX('&',LinkContent,CHARINDEX('vsub=',LinkContent)+5 ) > 1  THEN
			substring(LinkContent, CHARINDEX('vsub=',LinkContent)+5, CHARINDEX('&',LinkContent,CHARINDEX('vsub=',LinkContent)+5 )-(CHARINDEX('vsub=',LinkContent)+5)   )
		ELSE
	    	substring(LinkContent, CHARINDEX('vsub=',LinkContent)+5, LEN(LinkContent)  ) 
	    END 
      ELSE 'no content subcategory'
    END as LinkSubcategory,

	Case 
	  WHEN CHARINDEX('vpos=',LinkContent) > 1  THEN
		Case
		WHEN CHARINDEX('&',LinkContent,CHARINDEX('vpos=',LinkContent)+5 ) > 1  THEN
			substring(LinkContent, CHARINDEX('vpos=',LinkContent)+5, CHARINDEX('&',LinkContent,CHARINDEX('vpos=',LinkContent)+5 )-(CHARINDEX('vpos=',LinkContent)+5)   )
		ELSE
	    	substring(LinkContent, CHARINDEX('vpos=',LinkContent)+5, LEN(LinkContent)  ) 
	    END 
      ELSE 'no content position'
    END as LinkPosition,

c.SubscriberKey, LinkName,
 CHARINDEX('&',LinkContent,CHARINDEX('utm_content=',LinkContent)+12 ) as length
from _Click c with (NOLOCK)
join _Job j on c.JobID = j.JobID
where c.JobID in (
    select JobID
    from [Newsletter KPI Past month])
and c.LinkContent NOT LIKE '%e-mail.visitorlando%'
