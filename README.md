<h1 align="center">
Phoenix Api
</h1>
<p align="center">
  <img alt="Elixir" src="https://img.shields.io/badge/elixir-%234B275F.svg?style=for-the-badge&logo=elixir&logoColor=white" />
  <br>
  <br>
  <img alt="Website" src="https://img.shields.io/website?down_color=red&down_message=down&label=server%20status&up_color=green&up_message=up&url=https%3A%2F%2Fphoenix-api.gigalixirapp.com%2Fapi%2Fhealth">
</p>

Rewriting custom Elixir (Phoenix) json api / backend for a work project built with .NET 6 (C#) / Vue3 (TypeScript & TailwindCSS).

## Setup

Set DB env variables in `config/dev.secret.exs`, see `config.dev.exs` for example.

**Make sure postgres is running.**

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`

## Start

To start your Phoenix server:

- Start Phoenix endpoint with `mix phx.server` or inside IEx with:
  - `iex -S mix phx.server` (bash)
  - `iex.bat -S mix phx.server` (powershell)

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Requests

Run `mix phx.routes` to get a list of all available routes.

Send a request, e.g.:

- [http://localhost:4000/api/health](http://localhost:4000/api/health)
- `curl http://localhost:4000/api/health`
- `curl http://localhost:4000/api/channels`

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

#### Test Local Build

Create a free production DB on [railway.app](https://railway.app/).

**Windows (PS)**

```powershell
# set env variables
$env:SECRET_KEY_BASE = "$(mix phx.gen.secret)"
$env:DATABASE_URL="postgresql://${{user}}:${{password}}@${{host}}.railway.app:${{port}}/${{database}}"
$env:MIX_ENV = "prod"

# build release
mix release

# set remaining variables:
$env:APP_NAME = "phoenix_api_v2"
$env:PORT = 4000

# start server
_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 start
```

**Bash**

```bash
# set env variables
export SECRET_KEY_BASE="$(mix phx.gen.secret)"
export DATABASE_URL="postgresql://${{user}}:${{password}}@${{host}}.railway.app:${{port}}/${{database}}"

# build release
MIX_ENV=prod mix release

# start server
MIX_ENV=prod APP_NAME=phoenix_api_v2 PORT=4000 _build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 start
```

**Manage release**

```powershell
# remote in from new terminal (opens iex)
\_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 remote

# stop from other terminal
\_build/prod/rel/phoenix_api_v2/bin/phoenix_api_v2 stop
```

**Run migrations**

[Docs: Run Migrations](https://gigalixir.readthedocs.io/en/latest/database.html#migrations)

## Deploy

Once you've tested the local version you can deploy easily with gigalixir.

- install the gigalixir cli and create a user: [Docs: Getting started](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface)

- login: `gigalixir login`
- check app is created: `gigalixir apps`

The app needs configuring to run on gigalixir:

[Docs: Modifying an existing app](https://gigalixir.readthedocs.io/en/latest/modify-app/index.html#modifying-existing-app)

There are three different deployment modes: mix, distillery or elixir releases. Releases seemed like the best option.

[Docs: Elixir Releases](https://gigalixir.readthedocs.io/en/latest/modify-app/releases.html#modifying-existing-app-with-elixir-releases)

Once you've tested the local version, push the branch to gigalixir:

`git push gigalixir`

Finally, run migrations on server

- `ssh_keygen` - create ssh key in ~/.ssh/id_rsa.pub
- `gigalixir account:ssh_keys:add "$(cat ~/.ssh/id_rsa.pub)"`
- `gigalixir ps:migrate` - run db migrations

#### Server management / monitoring

- `gigalixir logs` - monitor logging on the server
- `gigalixir ps:remote-console` - open iex on the server
- `gigalixir ps:ssh` - ssh into the production container (where the release is deployed)

## Learn more

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

- deploy to update
- 07/12/2022 - deploy
- 03/01/2023 - deploy
