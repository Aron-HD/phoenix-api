alias Api.Repo
alias Api.Channels.ChannelGroup

# mix run priv/repo/seeds/channel_group_seeds.exs

Repo.insert!(%ChannelGroup{
  name: "Channel Group 1",
})
Repo.insert!(%ChannelGroup{
  name: "Channel Group 2",
})
