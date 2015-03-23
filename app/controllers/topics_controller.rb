 class TopicsController < ApplicationController
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
    @topic=Topic.new
      authorize @topic
  end
 
 def create
      @topic= Topic.new(params.require(:topic).permit(:name,:description,:public))
     authorize @topic
     if @topic.save
       flash[:notice] = "Topic was saved."
       redirect_to @topic
     else
       flash[:error] = "There was an error saving the topic. Please try again."
       render :new
     end
   end

  def edit
    @topic = Topic.find(params[:id])
      authorize @topic
  end

def update
     @topic= Topic.find(params[:id])
      authorize @topic
     if @topic.update_attributes(params.require(:topic).permit(:name,:description,:public))
       flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash[:error] = "There was an error saving the topic Please try again."
       render :edit
     end
   end
 end