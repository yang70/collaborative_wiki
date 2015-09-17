class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def authors
    @authors = User.all
  end

  def author
    @author = User.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      current_user.topics << @topic
      redirect_to @topic
      flash[:notice] = "#{@topic.title} was successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update_attributes(topic_params)
      current_user.topics << @topic
      flash[:success] = "#{@topic.title} was updated!"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    name = @topic.title
    @topic.destroy
    flash[:success] = "#{name} was deleted!"
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
