class ArticlesController < ApplicationController
  def index
  end
  #显示用户的文章
  def now
    @articles = current_user.articles
  end

  #增加新文章
  def new
    @article = Article.new
  end
  def create
    @article = current_user.articles.build( article_params )
    if @article.save
      redirect_to articles_now_url(  )
    else
      render :action => :new
    end
  end

  protected

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
