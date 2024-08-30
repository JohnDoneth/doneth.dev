defmodule Website.PostLayout do
  use Tableau.Layout, layout: Website.RootLayout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="mt-8 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="max-w-2xl mx-auto">
        <article class="prose">
          <%= {:safe, render(@inner_content)} %>
        </article>
      </div>
    </div>
    """
  end
end
