require 'rails_helper'

RSpec.describe Phrase, type: :model do
  describe "Initialization" do
    let(:no_text_phrase) { build(:phrase, text: nil) }
    let(:no_user_phrase) { build(:phrase, user: nil) }
    let(:phrase_with_correct_credentials) { build(:phrase) }

    it "should not create a phrase without a text in it" do
      no_text_phrase.save
      expect(no_text_phrase).to be_a_new_record
    end

    it "should not create a phrase without a user in it" do
      no_user_phrase.save
      expect(no_user_phrase).to be_a_new_record
    end

    it "should create a phrase with a text and user" do
      phrase_with_correct_credentials.save
      expect(phrase_with_correct_credentials).to_not be_a_new_record
    end
  end
end
