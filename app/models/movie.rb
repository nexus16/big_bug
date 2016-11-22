class Movie < ActiveRecord::Base
	validates :image, presence: true
  	has_attached_file :image, styles: { :medium => "640x" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	has_many :reviews
  	belongs_to :category
end
