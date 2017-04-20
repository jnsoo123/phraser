require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "Creation" do
    let(:favorite) { build(:favorite) }
    let(:favorite_with_no_user) { build(:favorite, user: nil) }
    let(:favorite_with_no_phrase) { build(:favorite, phrase: nil) }

    it "should create a favorite with phrase and user in it" do
      favorite.save
      expect(favorite).to_not be_a_new_record
    end 

    it "should not create with no user" do
      favorite_with_no_user.save
      expect(favorite_with_no_user).to be_a_new_record
    end

    it "should not create with no phrase" do
      favorite_with_no_phrase.save
      expect(favorite_with_no_phrase).to be_a_new_record
    end

    it "should not create a favorite with the same phrase and user" do
      favorite.save
      favorite2 = build(:favorite, user: favorite.user, phrase: favorite.phrase)
      favorite2.save
      expect(favorite2).to be_a_new_record
    end
  end
end
