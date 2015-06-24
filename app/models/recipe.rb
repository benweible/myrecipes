class Recipe < ActiveRecord::Base
	belongs_to :chef
	validates :name, presence: true, length:{minimum:5, maximum:100}
	validates :summary, presence: true, length:{minimum:5, maximum:900}
	mount_uploader :picture, PictureUploader
	validate :picture_size
  
  private
 		def picture_size
 			if picture.size > 5.megabytes
 			errors.add(:picture, "Picture must be less thatn 5 megabytes")
			end
		end
end 	