class SearchsController < ApplicationController
    def search
        @method = params[:method]
        @word = params[:word]
        @model = params[:model]
        if @model == "User"
          @users = User.search(@method, @word)
        else
          @books = Book.search(@method, @word)
        end
    end
end
