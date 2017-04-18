require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin) { User.new(role: "admin") }
  let(:user)  { User.new() }

  describe "Initialization" do
    it "should be a normal user" do
      expect(user).to_not be_admin
    end

    it "should be an admin if set to admin" do
      expect(admin).to be_admin
    end
  end
end
