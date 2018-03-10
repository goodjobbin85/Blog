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
			redirect_to articles_path
			flash[:success] = "New article created"
		else
			render :new
			flash[:notice] = "Sorry, invalid values"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
		flash[:success] = "Article deleted"
	end

	private

	def article_params
		params.require(:article).permit(:name, :title, :description)
	end
end
