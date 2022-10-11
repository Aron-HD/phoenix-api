alias Api.Repo
alias Api.Channels.Channel

# mix run priv/repo/seeds/channel_seeds.exs

Repo.insert!(%Channel{
  channel_number: 1,
  name: "TTV",
  stream_address: "312.123.322.122",
  stream_port: 5000,
  mode: "UDP",
})
Repo.insert!(%Channel{
  channel_number: 3,
  name: "Main Stage",
  stream_address: "312.123.322.122",
  stream_port: 5002,
  mode: "RTP",
})
Repo.insert!(%Channel{
  channel_number: 100,
  name: "Box Office",
  stream_address: "312.123.322.122",
  stream_port: 5000,
  mode: "UDP",
})
Repo.insert!(%Channel{
  channel_number: 102,
  name: "Leaderboard",
  stream_address: "312.123.322.122",
  stream_port: 5002,
  mode: "RTP",
})
Repo.insert!(%Channel{
  channel_number: 110,
  name: "Hole 18",
  stream_address: "312.123.322.122",
  stream_port: 5000,
  mode: "UDP",
})
Repo.insert!(%Channel{
  channel_number: 111,
  name: "Player Lounge",
  stream_address: "312.123.322.122",
  stream_port: 5002,
  mode: "RTP",
})
