class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :photo, styles: { medium: "242x200>", thumb: "171x180>" }, default_url: "http://sol-distribution.com.au/c.1031379/sca-dev-denali//img/no_image_available.jpeg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def self.search(search)
  where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
  end

end
