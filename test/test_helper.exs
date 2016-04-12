ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FinalForum.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FinalForum.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FinalForum.Repo)

