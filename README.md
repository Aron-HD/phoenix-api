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

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
