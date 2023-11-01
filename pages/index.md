---
title: Stargazer Statistics
sources:
- stargazers.sql
---

Here are all the stars for the repo, [evidence-dev/evidence](https://github.com/evidence-dev/evidence) starting with the most recently starred. 

Click on a user's name to see more.


<DataTable data={stargazers} link=login>
  <Column id=name/>
  <Column id=login/>
  <Column id=location/>
  <Column id=company/>
</DataTable>


## Summary Statistics

```sql number_of_stargazers
SELECT COUNT(*) AS number_of_stargazers
FROM ${stargazers};
```

<BigValue
  data={number_of_stargazers}
  value=number_of_stargazers
/>

```sql countries
select * from read_csv_auto('sources/country_lookup.csv', header=True)
```

## Location

```sql location_statistics
-- Top 10 locations with the most stargazers
SELECT 
  country, 
  COUNT(*) AS number_of_stargazers
FROM ${stargazers} as stargazers
left join read_csv_auto('sources/country_lookup.csv', header=True) as country_lookup
on country_lookup.location = stargazers.location
where country_lookup.location is not null
and country != 'null'
GROUP BY all
ORDER BY 2 DESC
limit 10
```

<BarChart
  title="Number of Stargazers by Country"
  data={location_statistics}
  x=country
  y=number_of_stargazers
  swapXY
/>



## Influential Stargazers

```sql followers
-- Stargazers with the highest followers-following ratio
SELECT 
  login, 
  name,
  followers
FROM ${stargazers}
ORDER BY 3 DESC
```



```sql followers_following_ratio
-- Stargazers with the highest followers-following ratio
SELECT 
  login, 
  name,
  followers, 
  following, 
  followers / following AS followers_following_ratio
FROM ${stargazers}
ORDER BY 5 DESC
```

<ScatterPlot
  title="Followers-Following Plot of Stargazers"
  data={followers_following_ratio}
  x=following
  y=followers
  yMin=0
  tooltipTitle=login
/>

The top 10 users by follower/following ratio that have starred your project are:

{#each followers_following_ratio.slice(0, 10) as user}

- **[{user.login}]({user.login})**: {fmt(user.followers_following_ratio,"0x")}

{/each}
<br/>

The top 10 users by absolute number of followers are:

{#each followers.slice(0, 10) as user}

- **[{user.login}]({user.login})**: {user.followers} followers

{/each}


### GitHub Account Age Distribution

```sql user_account_age
-- Account age of the top 10 stargazers
SELECT 
  count(login) as number_of_stargazers,
  DATE_PART('year', NOW()) - DATE_PART('year', created_at::datetime) AS account_age_years
FROM ${stargazers}
group by all
ORDER BY 2
```

<BarChart
  title="Number of Stargazers by Account Age in Years"
  data={user_account_age}
  x=account_age_years
  y=number_of_stargazers
  xMin=0
/>


<style>
  /* remove the spacing after each individual ul that is created, add spacing between items */
  ul {
    margin-bottom: 0;
    margin-top: 0.25rem;
  }
  /* except the final one */
  ul:last-of-type {
    margin-bottom: 1.2em;
  }
</style>