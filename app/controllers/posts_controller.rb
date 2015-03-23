class PostsController < ApplicationController
 def index
    @total=(Topic.count).to_f
    @pages=(@total/10).ceil
    @page=(params[:page]).to_i || 1
    @topics=Topic.limit(10).offset((@page-1)*10)
    authorize @topics
  end

  def show
    @topic= Topic.find(params[:id])
      @totalposts=(@topic.posts.count).to_f
      @pages=(@totalposts/10).ceil
      @page=(params[:page]).to_i || 1
      @posts=@topic.posts.limit(10).offset((@page-1)*10)
    authorize @topic
  end

  def new
     @topic = Topic.find(params[:topic_id])
     @post=Post.new
      authorize @post
  end
 
 def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic=@topic
     authorize @post
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic,@post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
  end

def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic,@post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  private

def post_params
  params.require(:post).permit(:title, :body)
end
end
