defmodule Website.HomePage do
  use Tableau.Page,
    layout: Website.RootLayout,
    permalink: "/"

  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="mt-8 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="max-w-2xl mx-auto">
        <article class="prose">
          <div>
            <div class="grid place-items-center">
              <img src="/images/portrait.png" class="h-32 rounded-full" />
            </div>
            <p>
              hello, world!
            </p>
          </div>
        </article>
      </div>
    </div>
    """
  end
end
