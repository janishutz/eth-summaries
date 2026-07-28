SELECT d.user_id   AS user_id,
       d.analytics AS analytics,
       d.survey_id AS surveyid
FROM (
    ((annotator NATURAL JOIN app_user) users
    JOIN survey_users su ON su.users_id = users.user_id) u
    JOIN survey s ON u.survey_id = s.id
) d
WHERE d.analytics <> ''
  AND d.analytics LIKE '%x%'
  AND d.title <> 'testing'
  AND d.further_options <> '';
