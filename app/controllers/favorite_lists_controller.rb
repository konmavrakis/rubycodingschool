class FavoriteListsController < ApplicationController

    def index
      
      @fav_lists = FavoriteList.joins(:list).includes(:list).where(user_id: current_user.id, :lists => {:active => true})
      
    end 

    def create
        @fav_list = FavoriteList.create(list_id: params[:list_id],user_id: current_user.id)

        respond_to do |format|   
            format.html { redirect_to :back, notice: 'List was added to favorites' }
            format.json { render json: {resp: 'ok', list: @fav_list} }           
        end

    end    

    def destroy 
        FavoriteList.find(params[:id]).delete
        respond_to do |format|   
            format.html { redirect_to :back, notice: 'List was removed from favorites' }
            format.json { render json: {resp: 'ok'} }          
        end
    end
end
