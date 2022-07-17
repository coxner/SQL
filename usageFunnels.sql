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