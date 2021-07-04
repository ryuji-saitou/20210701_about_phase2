class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    if @book_comment.save
      redirect_to book_path(@book)
    else
      @book_comments = @book.book_comments
      @book_new = Book.new
      @user = @book.user
      render "books/show"
    end
  end

  def destroy
    BookComment.find_by(book_id: params[:book_id], id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end
