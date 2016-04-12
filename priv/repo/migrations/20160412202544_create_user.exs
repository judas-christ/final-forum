defmodule FinalForum.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string

      timestamps
    end

    create unique_index(:users, [:email])

    alter table(:posts) do
      remove :topic_id
      add :user_id, references(:users)
      add :topic_id, references(:topics)
    end
  end
end
