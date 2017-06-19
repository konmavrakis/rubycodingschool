class PagesController < ApplicationController
  def home
  	@list = List.where('active=?', 1)
  end
end
