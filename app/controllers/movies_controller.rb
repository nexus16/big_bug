class MoviesController < ApplicationController
	def index
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC").paginate(:page => params[:page],:per_page => 10)
    else
      @movies = Movie.all.order('created_at DESC').paginate(:page => params[:page],:per_page => 10)
    end
	end

	def show
		@movie = Movie.find(params[:id])
		@comment = Comment.new
		@review = Review.where user_id: current_user.id, movie_id: @movie.id
	end
end
