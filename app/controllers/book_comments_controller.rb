class BookCommentsController < ApplicationController
 
    
    def create
        @book = Book.find(params[:book_id])
        @book_comment = current_user.book_comments.new(book_comment_params)
        @book_comment.book_id = @book.id
        @book_comment.user_id = current_user.id
        unless @book_comment.save
            render :error
        # if @comment.save
        #     redirect_to book_path(book)
        # else
        #     redirect_back(fallback_location: root_path)
        # end
        end
    end
    
    def destroy
        # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        # redirect_back(fallback_location: root_path)
        @book = Book.find(params[:book_id])
        book_comment = @book.book_comments.find(params[:id])
        book_comment.destroy
    end
    
    private
    
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
    
    
   

end

