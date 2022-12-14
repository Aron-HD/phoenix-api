defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Accent.Plug.Request, case: Accent.Case.Snake

    plug Accent.Plug.Response,
      default_case: Accent.Case.Camel,
      json_codec: Jason
  end

  scope "/api", ApiWeb do
    pipe_through :api
    get "/health", HealthController, :index
    resources "/channels", ChannelController, except: [:new, :edit]
    resources "/channel_groups", ChannelGroupController, except: [:new, :edit]
    resources "/stbs", StbController, except: [:new, :edit]
    resources "/stb_groups", StbGroupController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through [:fetch_session, :protect_from_forgery]
  #     live_dashboard "/dashboard", metrics: ApiWeb.Telemetry
  #   end
  # end
end
