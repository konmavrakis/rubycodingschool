class FavoriteListsController < ApplicationController

    def index
      @lists = FavoriteList.where(user_id: current_user.id)
      
    end 

    def create
        FavoriteList.create(list_id: params[:list_id],user_id: current_user.id)
        redirect_to :back
    end    

    def destroy
        FavoriteList.find(params[:id]).delete
        redirect_to :back
    end
end
