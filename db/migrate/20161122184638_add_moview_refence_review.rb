class AddMoviewRefenceReview < ActiveRecord::Migration
  def change
  	add_reference :reviews, :movie, foreign_key: true, index: true
  end
end
