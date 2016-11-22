class Admin::MoviesController < ApplicationController
	before_action :set_movie, only: [:show] 

	def index
		@movies = Movie.all;
	end
	def new
		@movie = Movie.new
	end
	def show

	end
	def create
		@movie = Movie.create(movie_params)
		redirect_to admin_movies_path
	end

	private

	def movie_params
		params.require(:movie).permit(:name,:director,:description,:image)
	end
	def set_movie
      @movie = Movie.find(params[:id])
    end
end
