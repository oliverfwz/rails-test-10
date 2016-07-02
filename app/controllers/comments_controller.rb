class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @root_comments = Comment.includes(:children).roots
  end

  def new
    @comment = Comment.new
    @parent_id = params[:parent]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def edit
    @comment = Comment.find(comment_id)
    @result = true if (current_user == @comment.user && !@comment.children.present?)
  end

  def update
    @comment = Comment.find(comment_id)
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(comment_id)
    if (current_user == @comment.user && !@comment.children.present?)
      @result = true
      @comment.destroy
    end
  end

  private

  def comment_params
    data = params.require(:comment).permit(:message, :parent_id)
    data[:user_id] = current_user.id
    data
  end

  def comment_id
    params.require(:id)
  end
end