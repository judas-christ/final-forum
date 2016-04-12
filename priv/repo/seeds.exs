# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FinalForum.Repo.insert!(%FinalForum.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user_changeset = FinalForum.User.changeset(%FinalForum.User{email: "user@example.com", password: "12345"})
user = FinalForum.Repo.insert!(user_changeset)

topic = FinalForum.Repo.insert!(%FinalForum.Topic{title: "First!"})
FinalForum.Repo.insert!(%FinalForum.Post{topic_id: topic.id, body: "Woohoo!", user_id: user.id})
