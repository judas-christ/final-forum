defmodule FinalForum.PageController do
  use FinalForum.Web, :controller

  def index(conn, _params) do
    topics = Repo.all FinalForum.Topic

    conn
    |> assign(:topics, topics)
    |> render(:index)
  end

  def topic(conn, %{"topic_id" => topic_id}) do

    topic = Repo.get FinalForum.Topic, topic_id
    topic = Repo.preload topic, :posts

    new_post = FinalForum.Post.changeset %FinalForum.Post{}

    conn
    |> assign(:topic, topic)
    |> assign(:new_post, new_post)
    |> render(:topic)
  end
end
