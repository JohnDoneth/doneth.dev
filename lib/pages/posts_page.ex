defmodule Website.HomePage do
  use Tableau.Page,
    layout: Website.RootLayout,
    title: "Posts",
    permalink: "/posts"

  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="mt-8 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="max-w-2xl mx-auto">
        <ul>
          <%= for post <- @posts do %>
            <li>
              <span><%= Calendar.strftime(post.date, "%Y-%m-%d") %></span>
              <a href={post.permalink}><%= post.title %></a>
            </li>
          <% end %>

        
        </ul>
      </div>
    </div>
    """
  end
end
