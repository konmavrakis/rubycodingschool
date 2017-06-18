class PagesController < ApplicationController
  def home
  	@list = List.all
  end
end
