require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { is_expected.to have_many :reviews }

  it "is not valid if it is a duplicate entry" do
	Restaurant.create(name:'KFC')
	restaurant = Restaurant.create(name:'KFC')
	expect(restaurant).to have(1).error_on(:name)
	expect(restaurant).not_to be_valid  	
  end

  it "is not valid if no name" do
	restaurant = Restaurant.create(name:'a')
	expect(restaurant).to have(1).error_on(:name)
	expect(restaurant).not_to be_valid  	
  end

end
