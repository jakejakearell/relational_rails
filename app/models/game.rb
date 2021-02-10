class Game < ApplicationRecord
  has_many :players, :dependent => :destroy

  def self.order_by_created_date
    Game.order(created_at: :desc)
  end

  def self.number_of_players(game_id)
    Game.joins("INNER JOIN players ON players.game_id = games.id").where("games.id = ?", game_id).count
  end
end
