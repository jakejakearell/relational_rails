class Player < ApplicationRecord
  belongs_to :game

  def self.injured?(params)
    Player.where("game_id = ? AND injured = ?", params[:id], true)
  end

  def self.weight?(params)
    Player.where("game_id = ? AND weight > ?", params[:id], params[:query] )
  end

  def self.alphabetize(params)
    Player.order(:position).where("game_id = ? AND injured = ?", params[:id], true)
  end

end
