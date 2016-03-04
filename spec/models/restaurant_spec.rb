require 'rails_helper'

describe Restaurant, type: :model do
	it { is_expected.to have_many :reviews }
  it {is_expected.to belong_to :user }
  it 'is not valid with a name of less than thre characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end


describe 'reviews' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }

    subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

    it 'builds a review' do
      expect(review).to be_a Review
    end

    it 'builds a review associated with the specified user' do
      expect(review.user).to eq user
    end
  end

  describe '#average_rating' do 
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant=Restaurant.create(name:'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'  
      end
    end
  end

  context '1 review' do
    let(:user) { User.create email: 'test@test.com' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }
    it 'returns that rating' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.build_with_user(review_params, user)
      expect(restaurant.average_rating).to eq 5
    end
  

  context 'multiple reviews' do
    let(:user1) { User.create email: 'test@test.com' }
    let(:user2) { User.create email: 'test@test.com' }
    let(:review_params) { {rating: 1, thoughts: 'yum'} }
    let(:review_params2) { {rating: 5, thoughts: 'yum'} }
  it 'returns the average' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.build_with_user(review_params, user1)
      restaurant.reviews.build_with_user(review_params2, user2)
      expect(restaurant.average_rating).to eq 3
  end
end


  end


end