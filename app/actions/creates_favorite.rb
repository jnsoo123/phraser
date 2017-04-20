class CreatesFavorite
  attr_accessor :user, :phrase, :favorite

  def initialize(user: nil, phrase: nil)
    @user = user
    @phrase = phrase
  end

  def build
    self.favorite = Favorite.new(user: user, phrase: phrase)
  end

  def create
    build
    status = favorite.save
    unless status
      Favorite.where(user: favorite.user, phrase: favorite.phrase).first.destroy
    end
  end
  
end
