class ArticlesController < ApplicationController

	def index 
		@article = Article.all
	end
	def show 
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		if @article.save
			redirect_to article_path(@article)
			flash[:success] = "Article successfully updated!"
		else
			render :edit
			flash[:notice] = "Sorry, try again..."
		end
	end

	def create 
		@article = Article.new(article_params)
		if @article.save
			redirect_to root_path
			flash[:succes] = "New article created"
		else
			render :new
			flash[:notice] = "Sorry, invalid values"
		end
	end

	private

	def article_params
		params.require(:article).permit(:name, :title, :description)
	end
end
