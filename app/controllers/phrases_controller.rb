class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.all.reverse
  end

  def create
    @phrase = Phrase.new(phrase_params)
    @phrase.user = current_user
    @phrase.save
    redirect_to root_path
  end

  def mark_favorite
    phrase = Phrase.find(params[:id])
    @action = CreatesFavorite.new(user: current_user, phrase: phrase)
    @action.create
    redirect_to root_path
  end

  private

  def phrase_params
    params.require(:phrase).permit(:text)
  end
end
