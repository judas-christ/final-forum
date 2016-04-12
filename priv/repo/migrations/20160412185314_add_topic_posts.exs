defmodule FinalForum.Repo.Migrations.AddTopicPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :topic_id, :integer
    end
  end
end
