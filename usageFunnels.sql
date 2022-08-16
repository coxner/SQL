--Counts the number of distict users that answer each question
SELECT question_text,
   COUNT(DISTINCT user_id)
FROM survey_responses
GROUP BY 1;
-- using a case statement to count user responses based on a condition
SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) AS 'control_clicks',
  COUNT (DISTINCT CASE 
  WHEN ab_group = 'variant' THEN user_id END) AS 'variant_clicks'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;
-- Joining multiple tables and setting column conditions
 SELECT DISTINCT b.browse_date, b.user_id, c.user_id IS NOT NULL AS 'is_checkout', p.user_id IS NOT NULL AS 'is_purchase'
 FROM browse AS 'b'
 LEFT JOIN checkout AS 'c'
 ON b.user_id = c.user_id
 LEFT JOIN purchase AS 'p'
 ON p.user_id = c.user_id
 LIMIT 50;

--putting data into a format to caulate total sales 



--Creating a funnel and checking date condition to see if more purchase are made while xmas approaches
WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT browse_date, COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels
GROUP BY 1
ORDER BY 1;

-- the true or false columns are summed with 1 and 0 and the sum is the total number of purchases