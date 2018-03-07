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

	def create 
		
	end

	private

	def article_params
		params.require(:articles).permit(:name, :title, :description)
	end
end
