class FavoritesController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     @favorite = current_user.favorites.build(post: @post)
     authorize @favorite
 
     if @favorite.save
       flash[:notice] = "Favorite was saved."
       redirect_to [@post.topic,@post]
     else
       flash[:error] = "There was an error in favoriting. Please try again."
       render :new
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite=Favorite.find(params[:id])
    authorize @favorite

    if @favorite.destroy
       flash[:notice] = "Post was removed from favorites."
       redirect_to [@post.topic,@post]
     else
       flash[:error] = "There was an error in removing favorite."
       redirect_to [@post.topic,@post]
     end
  end
end
