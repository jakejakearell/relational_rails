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
        player_3 = game_1.players.create!(position: "DB", weight: 195, injured: true)
        player_4 = game_2.players.create!(position: "DB", weight: 195, injured: true)

        params = {id: game_1.id}

        expected = [player_1, player_3]

        expect(Player.injured?(params)).to eq(expected)
      end
    end

    describe '#weight?' do
      it "returns only players that are above a weight entered by the user with results in the game's show page" do
        game_1 = Game.create!(televised: false,
                              stadium_name: "Wriggley",
                              attendance: 20000)
        game_2 = Game.create!(televised: false,
                              stadium_name: "Coors",
                              attendance: 25000)

        player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
        player_2 = game_1.players.create!(position: "RB", weight: 180, injured: false)
        player_3 = game_1.players.create!(position: "DB", weight: 195, injured: true)
        player_4 = game_2.players.create!(position: "DB", weight: 195, injured: true)

        params = {id: game_1.id, query: 190}

        expected = [player_1, player_3]

        expect(Player.weight?(params)).to eq(expected)
      end
    end

    describe '#alphabetize' do
      it "returns players that are injured in an alphabetized list on the game's show page" do
        game_1 = Game.create!(televised: false,
                              stadium_name: "Wriggley",
                              attendance: 20000)
        game_2 = Game.create!(televised: false,
                              stadium_name: "Coors",
                              attendance: 25000)

        player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
        player_2 = game_1.players.create!(position: "RB", weight: 180, injured: false)
        player_3 = game_1.players.create!(position: "DB", weight: 195, injured: true)
        player_4 = game_2.players.create!(position: "DB", weight: 195, injured: true)

        params = {id: game_1.id}

        expected = [player_3, player_1]

        expect(Player.alphabetize(params)).to eq(expected)
      end
    end
  end
end


# def self.weight?(params)
#   Player.where("game_id = ? AND weight > ?", params[:id], params[:query] )
# end
#
# def self.alphabetize(params)
#   Player.order(:position).where("game_id = ? AND injured = ?", params[:id], true)
# end
