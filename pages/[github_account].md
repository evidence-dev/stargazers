---
sources:
- stargazers.sql
---

<script>
let user = stargazers.filter(d => d.login == $page.params.github_account)[0];
</script>

# {$page.params.github_account}

<img src="{user.avatar_url}" alt="{user.name}" width="100" height="100" class="rounded-xl">

## {user.name}
{user.bio}

- **Company:** {user.company}
- **Website:** {user.blog}
- **Location:** {user.location}
- **Email**: [{user.email}](mailto:{user.email})
- **Twitter**: {#if user.twitter_username} <a href="https://www.twitter.com/{user.twitter_username}" class=markdown>{user.twitter_username}</a>{:else} null {/if}
- **GitHub**: [{user.login}]({user.html_url})
- **Followers**: {user.followers}
- **Following**: {user.following}
- **Created**: {user.created_at}
