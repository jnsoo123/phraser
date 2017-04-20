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
    @phrase = Phrase.find(params[:id])
    @phrase.favorites.create(user: current_user)
    redirect_to root_path
  end

  private

  def phrase_params
    params.require(:phrase).permit(:text)
  end
end
