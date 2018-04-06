select y.jobid, y.EmailName, y.linkcontent, y.counter as 'LinkClicks', y.ranking, y.LinkName, y.linkcategory,y.linksubcategory,y.linkposition,y.utmcontent
from (
  select x.jobid, x.EmailName, x.linkcontent, x.LinkName, x.counter,x.linkcategory,x.linksubcategory,x.linkposition,x.utmcontent, dense_rank() over (partition by x.jobid order by x.counter desc) ranking
  from (
    select c.jobid, c.EmailName, c.linkcontent, c.linkcategory,c.linksubcategory,c.linkposition,c.utmcontent, count(c.SubscriberKey) counter, c.LinkName
    from [Newsletter Links Clicked Past Month] c
    where c.linkcontent <> ''
    group by c.jobid, c.linkcontent, c.EmailName, c.LinkName,c.linkcategory,c.linksubcategory,c.linkposition,c.utmcontent
  ) x
) y
where y.ranking <= 100
