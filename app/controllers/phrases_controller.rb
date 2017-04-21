class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:mark_favorite, :destroy]
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
    @action = CreatesFavorite.new(user: current_user, phrase: @phrase)
    @action.create
    redirect_to root_path
  end

  def destroy 
    @phrase.destroy if current_user.phrases.include? @phrase
    redirect_to root_path
  end

  private

  def phrase_params
    params.require(:phrase).permit(:text)
  end

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
