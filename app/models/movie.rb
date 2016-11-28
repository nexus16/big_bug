class Movie < ActiveRecord::Base
    ratyrate_rateable "score"
    belongs_to :user
	validates :image, presence: true
  	has_attached_file :image, styles: { :medium => "640x" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	has_many :reviews
  	has_one  :avgs, class_name: "RatingCache",foreign_key: "cacheable_id"
  	belongs_to :category
  	def self.search(search)
  		where("name LIKE ?", "%#{search}%")
	end
end
