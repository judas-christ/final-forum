defmodule FinalForum.Post do
  use FinalForum.Web, :model

  schema "posts" do
    field :body, :string

    belongs_to :topic, FinalForum.Topic
    belongs_to :user, FinalForum.User

    timestamps
  end

  @required_fields ~w(body topic_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
