# Saitis Demo

## Usage

```sh-session
heroku login

cd <project-root>
heroku create saitis-demo
Creating ⬢ saitis-demo... done
https://saitis-demo.herokuapp.com/ | https://git.heroku.com/saitis-demo.git

# Change `homepage` to your heroku app URL (without trailing slash)
nano satis.json

# Change `HEROKU_APP_NAME` in `Makefile
nano HEROKU_APP_NAME

# Set up HTTP basic auth
# htpasswd .htpasswd <username>
htpasswd .htpasswd tangrufus

# Deploy to Heroku; Alternatively, set up CircleCI
make release
```

## CircleCI (packages.itineris.co.uk)

Add these environment variables:

Name | Value
-----| -----
`HEROKU_APP_NAME` | `YOUR_HEROKU_APP` (e.g: `saitis-demo`)
`HEROKU_API_KEY` | `YOUR_HEROKU_API_KEY`
`COMPOSER_AUTH` | `{"github-oauth":{"github.com":"YOUR_GITHUB_PERSION_ACCESS_TOKEN"}}`

## Composer Authentication (Local)

```bash
composer config --global http-basic.saitis-demo.herokuapp.com <username> <password>
```

## Bedrock

In `composer.json`:

```diff
  "repositories": [
+   {
+     "type": "composer",
+     "url": "https://saitis-demo.herokuapp.com"
+   }
```