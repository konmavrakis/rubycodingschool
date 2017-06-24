class PagesController < ApplicationController
  def home
  	@list = List.where('active=?', true).order('created_at desc').page(params[:page]).per(9)
  end
end
