class HomeController < ApplicationController
  def index
    @builds = Build.all
    @featured = Build.featured
  end
end
