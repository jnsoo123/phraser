require "rails_helper"

describe CreatesFavorite do
  let(:user) { create(:user) }
  let(:phrase) { create(:phrase) }

  it "creates a favorite with a given phrase and user" do
    creator = CreatesFavorite.new(user: user, phrase: phrase)
    creator.build 
    expect(creator.favorite.user).to eq user
    expect(creator.favorite.phrase).to eq phrase
  end  

  it "creates a record" do
    creator = CreatesFavorite.new(user: user, phrase: phrase)
    creator.create
    expect(Favorite.where(id: creator.favorite.id)).to be_present
  end

  it "deletes a record when unfavorited" do
    creator = CreatesFavorite.new(user: user, phrase: phrase)
    creator.create
    id = creator.favorite.id
    creator.create
    expect(Favorite.where(id: id)).to_not be_present
  end
end
