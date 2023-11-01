select 
  ROW_NUMBER() over () as row_number,
  login,
  name,
  company,
  blog,
  location,
  email,
  bio,
  twitter_username,
  public_repos,
  public_gists,
  followers,
  following,
  created_at,
  updated_at,
  avatar_url,
  url,
  html_url
from read_parquet('sources/stargazer_details.parquet')
order by 1 desc