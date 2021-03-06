# Kane

Kane. Citizen Kane. Charles Foster Kane, to be exact, Publisher extraordinaire. Rosebud.

Kane is for publishing and subscribing to topics using Google Cloud Pub/Sub.

## Installation

1. Add Kane to your list of dependencies in `mix.exs`:
  ```elixir
  def deps do
    [{:kane, "~> 0.0.5"}]
  end
  ```

2. Configure [Goth](https://github.com/peburrows/goth) (Kane's underlying token storage and retrieval library) with your Google JSON credentials:
  ```elixir
  config :goth,
    json: "path/to/google/json/creds.json" |> File.read!
  ```


## Usage

Pull, process and acknowledge messages via a pre-existing subscription:

```elixir
{:ok, subscription} = Kane.Subscription{topic: %Kane.Topic{name: "my-topic"}}
{:ok, messages} = Kane.Subscription.pull(subscription)

Enum.each messages, fn(mess)->
  process_message(mess)
end

# acknowledge message receipt in bulk
Kane.Subscription.ack(subscription, messages)
```

For more details, see the [documentation](http://hexdocs.pm/kane).
