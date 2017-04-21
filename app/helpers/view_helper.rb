module ViewHelper
  def link_to_favorite phrase
    link_to mark_favorite_path(phrase), class: "btn btn-xs btn-primary", method: :post do
      link = []
      link.push phrase.favorites.count
      link.push icon("heart#{'-o' unless current_user.fave_phrases.include?(phrase)}")
      link.push current_user.fave_phrases.include?(phrase) ? "Unfavorite" : "Favorite"
      link.map(&:to_s).join(" ").html_safe
    end
  end
end
