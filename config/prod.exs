use Mix.Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.

IO.puts("HOST: #{System.get_env("PROD_HOST")}")
IO.puts("PORT: #{System.get_env("PORT")}")
IO.puts("PROD_PORT: #{System.get_env("PROD_SECRET")}")
IO.puts("PROD_SECRET: #{System.get_env("PROD_PORT")}")
IO.puts("SSL KEY PATH: #{System.get_env("SSL_KEY_PATH")}")
IO.puts("SSL CERT PATH: #{System.get_env("SSL_CERT_PATH")}")

config :iphod, IphodWeb.Endpoint,
  http: [:inet6, port: {:system, "PORT"}],
  #  url: [host: "localhost", port: {:system, "PORT"}],
  url: [host: System.get_env("PROD_HOST"), port: System.get_env("PROD_PORT")],
  https: [
    :inet6,
    port: System.get_env("PROD_PORT"),
    cipher_suite: :strong,
    keyfile: System.get_env("SSL_KEY_PATH"),
    certfile: System.get_env("SSL_CERT_PATH")
  ],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  code_reloader: false,
  version: Mix.Project.config()[:version]

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :iphod, IphodWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         :inet6,
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :iphod, IphodWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases (distillery)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :iphod, IphodWeb.Endpoint, server: true
#
# Note you can't rely on `System.get_env/1` when using releases.
# See the releases documentation accordingly.

# Finally import the config/prod.secret.exs which should be versioned
# separately.

# config :phoenix_distillery, PhoenixDistillery.Endpoint,
#   http: [port: System.get_env("PORT")],
#   url: [host: "localhost", port: {:system, "PORT"}],
#   cache_static_manifest: "priv/static/manifest.json",
#   # https: [port: 443,
#   #         otp_app: :iphod,
#   #         keyfile: System.get_env("KEYFILE_PATH"),
#   #         certfile: System.get_env("CERTFILE_PATHDB_USERNAME"),
#   # ]
#   root: ".",
#   server: true,
#   version: Mix.Project.config()[:version]

import_config System.get_env("PROD_SECRET")
