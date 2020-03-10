class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def index
		@articles = Article.all
	end
	def show
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Article saved successfully."
			redirect_to article_path(@article)
		else
			flash[:danger] = "Looks like there was an error in saving your article."
			render 'new'
		end
	end
	def edit
	end
	def update
		if @article.update(article_params)
			flash[:success] = "Article successfully updated."
			redirect_to article_path(@article)
		else
			flash[:warning] = "We couldn't update your article. Try again."
			render 'edit'
		end
	end
	def destroy
		if @article.destroy
			flash[:success] = "Article was deleted."
			redirect_to articles_path
		else
			flash[:danger] = "Article was not deleted."
			redirect_to article_path(@article)
		end
	end
	private
		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :description)
		end
end