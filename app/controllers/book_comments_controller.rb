class BookCommentsController < ApplicationController
 
    
    def create
        @book = Book.find(params[:book_id])
        @comment = current_user.book_comments.new(book_comment_params)
        @comment.book_id = @book.id
        @comment.user_id = current_user.id
        @comment.save
        render :index
        # if @comment.save
        #     redirect_to book_path(book)
        # else
        #     redirect_back(fallback_location: root_path)
        # end
    end
    
    def destroy
        BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        render :index
        # redirect_back(fallback_location: root_path)
        
    end
    
    private
    
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
    
    
   

end

