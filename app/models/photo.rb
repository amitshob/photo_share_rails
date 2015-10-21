class Photo < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :title, :presence => true
  has_attached_file :image, styles: { large: "600 x 600", medium: "300 x 300", thumb: "150 x 150"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
