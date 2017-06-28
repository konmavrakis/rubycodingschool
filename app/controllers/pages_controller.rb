class PagesController < ApplicationController
  def home
    @list = List.search(params[:keyword], active: 1, page: params[:page], pages: 9 )
  end
end
