class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary=Summary.new
    authorize @post
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary=Summary.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
      authorize @post
    @summary = Summary.new(params.require(:summary).permit(:body))
    @post.summary=@summary
     if @summary.save
       redirect_to [@topic,@post], notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end

   def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.find(params[:id])
      authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.find(params[:id])
      authorize @post
    if @summary.update_attributes(params.require(:summary).permit(:body))
       flash[:notice] = "Summary was updated."
       redirect_to [@topic,@post]
    else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :edit
    end
  end
end
