/*Churn rate is the percent of subscribers that have canceled 
within a certain period, usually a month. For a user base to grow, 
the churn rate must be less than the new subscriber rate for the same period. 
churn rate = number of user at period beginning/ number of users who canceled
does not inlcude new customers who join within the same period of cancellations*/

-- code for churn rate

SELECT 1.0 * 
(
  SELECT COUNT(*)
  FROM subscriptions
  WHERE subscription_start < '2017-01-01'
  AND (
    subscription_end
    BETWEEN '2017-01-01'
    AND '2017-01-31'
  )
) / (
  SELECT COUNT(*) 
  FROM subscriptions 
  WHERE subscription_start < '2017-01-01'
  AND (
    (subscription_end >= '2017-01-01')
    OR (subscription_end IS NULL)
  )
) 
AS result;