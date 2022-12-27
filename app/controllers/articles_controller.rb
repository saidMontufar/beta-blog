class ArticlesController < ApplicationController
  # --> Before running any of the actions listed will run the function set_article
  # --> %i allows to write non-interpolated arrays separated by white spaces
  before_action :set_article, only: %i[show edit update destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was saved successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #---> Anything bellow is a priavte method to this controller

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
