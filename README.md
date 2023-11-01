# Analyse your GitHub stars

This is an open-source project that allows you to analyze who has starred your GitHub repository.

View the output at [https://evidence-stargazers.netlify.app](https://evidence-stargazers.netlify.app)

## Using this repo

1. Clone this repository `git clone https://github.com/evidence-dev/stargazers`
1. Get a [Github token](https://github.com/settings/tokens?type=beta) for your repo - you dont need any scopes - read only is fine.
1. Use the python file in [/scripts/scrape.ipynb](/scripts/scrape.ipynb) to get the stargazer data from GitHub and save it as a parquet file.
2. Install the [Evidence VSCode Extension](https://marketplace.visualstudio.com/items?itemName=Evidence.evidence-vscode).
3. Run Evidence by clicking the `> Start Evidence` Button.
4. Deploy the project to [Evidence Cloud](https://evidence.dev/cloud) or Netlify.