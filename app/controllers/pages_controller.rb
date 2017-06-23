class PagesController < ApplicationController
  def home
  	@list = List.where('active=?', 1).order('created_at desc')
  end
end
