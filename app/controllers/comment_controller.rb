class CommentController < ApplicationController
  before_action :authenticate_user!
  layout "articles_layout"

  def create
    @comment = Comment.new(comment_params)
    @comment.created_at = Time.now
    @article = Article.find(params[:article])
    @article.comments << @comment
    current_user.comments << @comment
    if @comment.save
      redirect_to article_url(:id => params[:article])
    else
      render :action => :show
    end
  end

  protected

  def article_params
    params.require(:article).permit(:title, :content)
  end
  def comment_params
    params.require(:comment).permit(:content)
  end

end
