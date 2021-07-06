class RelationshipsController < ApplicationController

  def create
# def follow(user_id)
#             follower.create(followed_id: user_id)
# end
  current_user.follow(params[:user_id])
    # model に def follow を定義していなければ下記でもOK？
    # follower.create(follower_id: current_user.id, followed_id: params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def follower_index
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followed_index
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
