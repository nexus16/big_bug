class MoviesController < ApplicationController
	def index
		@movies = Movie.all.paginate(:page => params[:page],:per_page => 10)
	end

	def show
		@movie = Movie.find(params[:id])
		@comment = Comment.new
	end
end
