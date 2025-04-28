use udaanous;
--
create table logins(
login_id int,
user_id int,
login_date date
);
select * from logins;
create table users(
user_id int,
name varchar(20),
signup_date date,
country char(20)
);
select * from users;
--
select date_format(users.signup_date,"%y-%m") as months, 
	   count(distinct(users.user_id)) AS signup_users, count(logins.user_id) as retained_users,
       round((count(distinct logins.user_id) / count(distinct users.user_id)) * 100,2) as retention_rate from users 
left join logins
on logins.user_id = users.user_id
and date_format(logins.login_date, "%y-%m") > date_format(users.signup_date, "%y-%m")
group by date_format(users.signup_date,"%y-%m")
order by months;
-- 
WITH signup_data AS (
    SELECT user_id, 
        DATE_FORMAT(STR_TO_DATE(signup_date, '%Y-%m-%d'), '%Y-%m') AS signup_month FROM users
),

login_data AS (
    SELECT 
        user_id, 
        DATE_FORMAT(STR_TO_DATE(login_date, '%Y-%m-%d'), '%Y-%m') AS login_month
    FROM logins
),

first_logins_after_signup AS (
    SELECT 
        s.signup_month,
        s.user_id,
        MIN(l.login_month) AS first_login_month
    FROM signup_data s
    LEFT JOIN login_data l 
      ON s.user_id = l.user_id 
     AND l.login_month > s.signup_month
    GROUP BY s.signup_month, s.user_id
),
signup_retention AS (
    SELECT
        signup_month,
        COUNT(user_id) AS signup_users,
        SUM(CASE WHEN first_login_month = 
        DATE_FORMAT(DATE_ADD(STR_TO_DATE(CONCAT(signup_month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH), '%Y-%m') THEN 1 ELSE 0 END) AS retained_users
    FROM first_logins_after_signup
    GROUP BY signup_month
),

monthly_active_users AS (
    SELECT
        DATE_FORMAT(STR_TO_DATE(login_date, '%Y-%m-%d'), '%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS monthly_active_users
    FROM logins
   -- WHERE STR_TO_DATE(login_date, '%Y-%m-%d') >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
    WHERE login_date BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY month
)

SELECT
    COALESCE(s.signup_month, m.month) AS month,
    s.signup_users,
    s.retained_users,
    ROUND((s.retained_users / s.signup_users) * 100, 1) AS retention_rate,
    m.monthly_active_users
FROM signup_retention s
LEFT JOIN monthly_active_users m
  ON s.signup_month = m.month
ORDER BY month;
