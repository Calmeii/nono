class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => ['now','new']
  layout "articles_layout"
  def index
    @articles = Article.all.order("watch desc")
    @new_articles = Article.all.order("created_at desc").limit(5)
  end
  #显示用户的文章
  def now
    @articles = current_user.articles
    @articles_comments = Comment.where(["article_id in (?)",current_user.articles.ids]).order("created_at
                                         desc").limit(5)
  end

  #显示指定文章
  def show
    @article = Article.where(:id => params[:id]).first
    @article.watch = @article.watch.to_i + 1
    @article.save
    @comments = @article.comments
    @comment = Comment.new
    @latest_articles = @article.user.articles.order("created_at desc").limit(5)
  end
  #增加新文章
  def new
    @article = Article.new
  end
  def create
    @article = current_user.articles.build( article_params )
    if @article.save
      redirect_to articles_now_url
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
