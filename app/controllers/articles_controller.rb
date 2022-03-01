class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  before_action :authenticate_user, only: [:create, :show, :new, :destroy]
  before_action :authenticate_user_edit, only: [:edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user = logged_in_user

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
       render json: @article
     else
       render json: @article.errors, status: :unprocessable_entity
    end
    
  end

  # DELETE /articles/1
  def destroy 
    authenticate_user ? (render json: {error: 'access denied'}, status: 401) :  @article.destroy 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def authenticate_user
      unless logged_in_user
        return true
      end
    end
    
end
