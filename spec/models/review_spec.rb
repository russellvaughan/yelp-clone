require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }

   it "is not valid if it has no rating" do
	review = Review.create(rating: 0)
	expect(review).to have(1).error_on(:rating)
	expect(review).not_to be_valid  	
  end
end
