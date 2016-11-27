class Admin::MoviesController < ApplicationController
	before_action :set_movie, only: [:show,:edit,:update] 

	def index
		@movies = Movie.all;
	end
	def new
		@movie = Movie.new
	end
	def show
	end

	def edit

	end

	def create
		@movie = Movie.create(movie_params)
		redirect_to admin_movies_path
	end

	def update
	    respond_to do |format|
	      if @movie.update(movie_params)
	        format.html { redirect_to admin_movies_path @movie, notice: 'MOvie was successfully updated.' }
	        format.json { render :show, status: :ok, location: @movie }
	      else
	        format.html { render :edit }
	        format.json { render json: @movie.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  def destroy
	  	@movie = Movie.find(params[:id])
	    @movie.destroy
	    respond_to do |format|
	      format.html { redirect_to admin_movies_url, notice: 'MOvie was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end



	private

	def movie_params
		params.require(:movie).permit(:name,:director,:description,:image)
	end
	def set_movie
      @movie = Movie.find(params[:id])
    end
end
