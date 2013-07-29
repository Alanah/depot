class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

# presence: true tells the validator to check that each of the named fields is present
# and its contents are not empty
  validates :title, :description, :image_url, presence: true
# validates that the price is a valid, positive number
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
# ensure that no other row in the products table has the same title
  validates :title, uniqueness: true 
  validates_length_of :title, :minimum => 10
# checks that the URL ends with one of the following: .gif, .jpg, or .png.
  validates :image_url, allow_blank: true, format: {
  	with:   %r{\.(gif|jpg|png)$}i,
  	message: 'must be a URL for GIF, JPG or PNG image.' 
  }

end
