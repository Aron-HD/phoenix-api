# Api

Rewriting custom Elixir (Phoenix) json api / backend for a work project built with .NET 6 (C#) / Vue3 (TypeScript & TailwindCSS).

## Setup

Set DB env variables in `config/dev.secret.exs`, see `config.dev.exs` for example.

**Make sure postgres is running.**

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`

## Start

To start your Phoenix server:

- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server` (bash), `iex.bat -S mix phx.server` (powershell)

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Requests

Run `mix phx.routes` to get a list of all available routes.

Send a request, e.g.:

GET: [http://localhost:4000/api/health](http://localhost:4000/api/health)

`curl http://localhost:4000/api/health`
`curl http://localhost:4000/api/channels`

POST / PATCH / PUT requests must send data in a payload with a data property:

```json
// POST: http://localhost:4000/api/channels
// Content-Type: application/json
{
  "data": {
    "name": "created",
    "channelNumber": 2,
    "mode": "RTP",
    "streamAddress": "312.123.322.122",
    "streamPort": 5000
  }
}
```

## Deploy

Deploy easily with gigalixir. [Docs: Getting started](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface)

- create user and login: `gigalixir login`
- check app is created: `gigalixir apps`

[Docs: Modifying an existing app](https://gigalixir.readthedocs.io/en/latest/modify-app/index.html#modifying-existing-app)
[Docs: Elixir Releases](https://gigalixir.readthedocs.io/en/latest/modify-app/releases.html#modifying-existing-app-with-elixir-releases)

#### Test Local Build

Create a free production DB on [railway.app](https://railway.app/).

1. set env variables:

**Windows (PS)**

- `$env:SECRET_KEY_BASE = "$(mix phx.gen.secret)"`
- `$env:DATABASE_URL="postgresql://${{user}}:${{password}}@${{host}}.railway.app:${{port}}/${{database}}"`
- `$env:MIX_ENV = "prod"`

2. build release: `mix release`
3. set remaining variables:

- `$env:APP_NAME = "phoenix_api_v2"`
- `$env:PORT = 4000`

4. start: `_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 start`

**Bash**

```bash
export SECRET_KEY_BASE="$(mix phx.gen.secret)"
export DATABASE_URL="postgresql://${{user}}:${{password}}@${{host}}.railway.app:${{port}}/${{database}}"
MIX_ENV=prod mix release
MIX_ENV=prod APP_NAME=phoenix_api_v2 PORT=4000 _build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 start
```

5. remote in from new terminal: `_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 remote` (opens iex)
6. stop from other terminal: `_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 stop`
7. git push gigalixir
8. run migrations. [Docs: Run Migrations](https://gigalixir.readthedocs.io/en/latest/database.html#migrations)

#### Push to Gigalixir

Once you've tested the local version, push to git remote:

`git push gigalixir`

``

## Learn more

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
