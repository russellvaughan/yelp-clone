class Restaurant < ActiveRecord::Base

has_many :reviews,
       -> { extending WithUserAssociationExtension }, 
      dependent: :destroy
belongs_to :user
 validates :name, length: {minimum: 3}, uniqueness: true

  
  def build_review(attributes={}, user)
  attributes[:user] ||= user 
  reviews.build(attributes)
  end

  def average_rating
  return 'N/A' if reviews.none?
  reviews.inject(0) {|memo, review| memo + review.rating} / reviews.size
	end


end
