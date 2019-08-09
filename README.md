[![Coverage Status](https://coveralls.io/repos/github/nanaki82/bot/badge.svg?branch=master)](https://coveralls.io/github/nanaki82/bot?branch=master)

# Bot

**TODO: Add description**

## Run Development

`docker-compos up -d` for Postgres (dockerized)

## Misc
Retrieve information about the telegram webhook
`https://api.telegram.org/bot{my_bot_token}/getWebhookInfo`

Run ngrok to receive the telegram update through webhook
`ngrok http -bind-tls=true --subdomain=goonies 8443`
ngrok web interface
`http://127.0.0.1:4040/inspect/http`
