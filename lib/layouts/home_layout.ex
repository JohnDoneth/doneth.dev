defmodule Website.HomeLayout do
  use Tableau.Layout, layout: Website.RootLayout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="mt-8 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="max-w-2xl mx-auto">
        <article class="prose">
          <div>
            <div class="grid place-items-center">
              <img src="/images/portrait.png" class="h-32 rounded-full p-1 shadow-xl" />
            </div>
            
            <article class="prose">
              <%= {:safe, render(@inner_content)} %>
              <h2>Recent Posts</h2>
              
              <ul>
                <%= for post <- Enum.take(@posts, 5) do %>
                  <li>
                    <a href={post.permalink}><%= post.title %></a>
                  </li>
                <% end %>
              </ul>
            </article>
          </div>
        </article>
      </div>
    </div>
    """
  end
end
