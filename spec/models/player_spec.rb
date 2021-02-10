require 'rails_helper'

describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :game }
  end

  describe 'instance methods' do
    describe '#injured?' do
      it 'returns only players that are injured to the child index' do
        game_1 = Game.create!(televised: false,
                              stadium_name: "Wriggley",
                              attendance: 20000)
        game_2 = Game.create!(televised: false,
                              stadium_name: "Coors",
                              attendance: 25000)

        player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
        player_2 = game_1.players.create!(position: "RB", weight: 180, injured: false)
        player_3 = game_2.players.create!(position: "DB", weight: 195, injured: true)

        params = {id: game_1.id}

        require "pry"; binding.pry
      end
    end
  end
end



# def self.injured?(params)
#   Player.where("game_id = ? AND injured = ?", params[:id], true)
# end
#
# def self.weight?(params)
#   Player.where("game_id = ? AND weight > ?", params[:id], params[:query] )
# end
