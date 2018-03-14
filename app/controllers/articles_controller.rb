class ArticlesController < ApplicationController

	def index 
		@articles = Article.all
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
			flash[:success] = "Article successfully updated!"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Sorry, try again..."
			render :edit
		end
	end

	def create 
		@article = Article.new(article_params)
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
end
