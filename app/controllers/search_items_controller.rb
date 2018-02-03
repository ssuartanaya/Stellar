class SearchItemsController < ApplicationController
    def index
        @text_search = params[:text_search]
        @videos = Video.where("lower(title) like lower('%#{@text_search}%')")
        @users = User.where("lower(username) like lower('%#{@text_search}%')")
    end
end
