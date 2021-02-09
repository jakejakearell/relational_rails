class Player < ApplicationRecord
  belongs_to :game

  def self.injured?(params)
    Player.where("game_id = ? AND injured = ?", params[:id], true)
  end
end
