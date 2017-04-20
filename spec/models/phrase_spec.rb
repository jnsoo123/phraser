require 'rails_helper'

RSpec.describe Phrase, type: :model do
  describe "Initialization" do
    let(:phrase) { Phrase.new }

    it "should not create a phrase without a text in it" do
      phrase.save
      expect(phrase).to be_a_new_record
    end

    it "should not create a phrase without a user in it" do
      phrase.text = "Test"
      phrase.save
      expect(phrase).to be_a_new_record
    end
  end
end
