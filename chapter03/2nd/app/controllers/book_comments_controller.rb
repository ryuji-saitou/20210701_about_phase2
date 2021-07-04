class BookCommentsController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      render "book/show"
    end
  end

  def destroy
    @comment = BookComment.find_by(book_id: params[:book_id], id: params[:id])
    @comment.destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_user
    comment = BookComment.find_by(book_id: params[:book_id], id: params[:id])
    unless comment.user == current_user
      redirect_to books_path
    end
  end

end
