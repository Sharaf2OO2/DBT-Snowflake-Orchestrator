-- Create a new user for dbt
CREATE USER dbt_user PASSWORD = 'password'
LOGIN_NAME = 'dbt_user'
DEFAULT_ROLE = ACCOUNTADMIN
MUST_CHANGE_PASSWORD = FALSE;

-- Grant role to user
GRANT ROLE ACCOUNTADMIN TO USER dbt_user

-- Grant access to the database
GRANT USAGE ON DATABASE finance_db TO ROLE ACCOUNTADMIN;

-- Grant access to the schema
GRANT USAGE ON SCHEMA finance_db.raw TO ROLE ACCOUNTADMIN;

-- Grant access to the warehouse
GRANT USAGE ON WAREHOUSE finance_wh TO ROLE ACCOUNTADMIN;

-- Grant table access
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA finance_db.raw TO ROLE ACCOUNTADMIN;