class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    # Railsではコントローラのインスタンス変数はすべてビューに渡されるようになっている
    @article = Article.find(params[:id])
  end
  def new
    # new => create
  end
  def edit
    # edit => update
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect

    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'しっぱいしたよnew'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'しっぱいしたよedit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
