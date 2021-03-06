use Mix.Config

config :goth,
  json: "config/test-credentials.json" |> Path.expand |> File.read!

config :kane, 
  token: Kane.TestToken,
  project_id: "test"
