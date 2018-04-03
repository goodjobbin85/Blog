class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index 
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def show 
		
	end

	def new
		@article = Article.new
	end

	def edit 
		
	end

	def update
		@article.update(article_params)
		if @article.save
			flash[:success] = "Article successfully updated!"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Sorry, try again..."
			render :edit
		end
	end

	def create 
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "New article created"
			redirect_to articles_path
		else
			flash[:danger] = "Sorry, invalid values"
			render :new
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:success] = "Article deleted"
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:name, :title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end

	def require_same_user
		if current_user != @article.user
			flash[:danger] = "You can only edit or delete your own articles"
			redirect_to root_path
		end
	end
end
