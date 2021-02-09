class Game < ApplicationRecord
  has_many :players

  def self.order_by_created_date
    Game.order(created_at: :desc)
  end

  def self.number_of_players
    Game.joins("INNER JOIN players ON players.game_id = games.id").length
  end
end
