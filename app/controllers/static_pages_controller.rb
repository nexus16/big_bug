class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:profile,:manager_reviews]
	before_action :require_admin,only: [:manager_reviews]
  def home
        @new_movies = Movie.all
        @most_rates = RatingCache.order(:avg => :desc).limit(4)
        @max_movies = []
        @most_rates.each do |most|
            @max_movies << Movie.find_by_id(most.cacheable_id)
        end
  end
  def profile
  	@user = current_user
  end
  def manager_reviews
  	@reviews = Review.all;
  end
end
