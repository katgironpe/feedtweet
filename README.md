# News Tweet

Tweet posts from various RSS feeds to a Twitter account.

## Dependencies

* Rails 4.2
* SideKiq
* Simple RSS
* Twitter

## Services Used

### Twitter

Retrieve your credentials from https://apps.twitter.com

### Bit.ly

Shortens URL's before tweeting the post

## How it works

This app uses ActiveJob and Sidekiq to retrieve, save posts and tweet them later.

## Configuration

Create the PostgreSQL databases

```bash
rake db:create
```

Run command for migration

```bash
rake db:migrate
```

### Configuration for development environment

On `config/settings/development.local.yml`, add your settings:

```ruby
title: Your Site Title
twitter:
  consumer_key: Twitter Consumer Key
  consumer_secret: Twitter Consumer Secret
  access_token: Twitter Access Token
  access_secret: Twitter Access Secret
bitly:
  login: Bitly Login
  key: Bitly API Key
```

## Deploying on Heroku

Use `heroku config:set` to set config variables.

Please check `config/settings/production.yml`

```ruby
title: <%= ENV['SITE_TITLE'] %>
twitter:
  consumer_key: <%= ENV['TWITTER_CONSUMER_KEY'] %>
  consumer_secret: <%= ENV['TWITTER_CONSUMER_SECRET'] %>
  access_token: <%= ENV['TWITTER_ACCESS_TOKEN'] %>
  access_secret: <%= ENV['TWITTER_ACCESS_SECRET'] %>
bitly:
  login: <%= ENV['BITLY_LOGIN'] %>
  key: <%= ENV['BITLY_KEY'] %>
```

### Set up Sidekiq

Add REDISTOGO add-on (FREE).

```bash
heroku config:set REDIS_PROVIDER=REDISTOGO_URL
```
