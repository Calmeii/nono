class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => ['now']
  layout "articles_layout"
  def index
    @articles = Article.all
  end
  #显示用户的文章
  def now
    @articles = current_user.articles
  end

  #显示指定文章
  def show
    @article = Article.find(params[:id])
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
  #更改文章
  def edit
    @article = current_user.articles.find(params[:id])
  end
  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_now_url
    else
      render :action => :edit
    end
  end
  #删除文章
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to articles_now_url
  end


  protected

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
