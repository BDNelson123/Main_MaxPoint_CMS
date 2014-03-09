class SearchController < ApplicationController
  def index
    @pages = Cms::Page.search(params[:term])
  end
end
