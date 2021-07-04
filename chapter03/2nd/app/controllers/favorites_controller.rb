class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    # ~~~ここからの下記4行を1行に集約~~~
    # ~~~favorite = Favorite.new
    # ~~~favorite.user_id = current_user.id
    # ~~~favorite.book_id = book.id
    # ~~~favorite.save
    # ~~~ここまでの下記4行を1行に集約~~~

  # save について、頭に current_user がつく時、
  # なぜ favorite はモデル名 → テーブル名に変化するのか？
  # Favorite.new(book_id: book.id, user_id: current_user.id).save
  # current_user.favorites.new(book_id: book.id).save
    current_user.favorites.new(book_id: book.id).save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    # ~~~ここからの下記2行を1行に集約~~~
    # ~~~favorite = Favorite.find_by(book_id: book.id, user_id: current_user.id)
    # ~~~favorite.destroy
    # ~~~ここまでの下記2行を1行に集約~~~

  # save について、頭に current_user がつく時、
  # なぜ favorite はモデル名 → テーブル名に変化するのか？
  # Favorite.find_by(book_id: book.id, user_id: current_user.id).destroy
  # current_user.favorites.find_by(book_id: book.id).destroy
    current_user.favorites.find_by(book_id: book.id).destroy
    redirect_to request.referer
  end

end
