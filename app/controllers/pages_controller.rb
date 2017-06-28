class PagesController < ApplicationController
  def home
    @list = List.search(params[:keyword],1, params[:page] )
  end
end
