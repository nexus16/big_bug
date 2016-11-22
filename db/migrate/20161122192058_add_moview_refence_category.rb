class AddMoviewRefenceCategory < ActiveRecord::Migration
  def change
  	add_reference :movies, :category, foreign_key: true, index: true
  end
end
