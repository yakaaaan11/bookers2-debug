class SearchsController < ApplicationController
    def search
        @word = params[:word]
        @model = params[:model]
        if @model == "User"
          @users = User.search(params[:method], params[:word])
        else
          @books = Book.search(params[:method],params[:word])
        end
    end
end
