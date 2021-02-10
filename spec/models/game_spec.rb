require 'rails_helper'

describe Game, type: :model do
  describe 'relationships' do
    it { should have_many :players }
  end

  describe 'instance methods' do
    describe '#order_by_created_date' do
      it 'returns the games listed with most recently created first' do
        game_1 = Game.create!(televised: false,
                              stadium_name: "Wriggley",
                              attendance: 20000,
                              created_at: "Mon Jun 02 12:35:19 -0700 2008")
        game_2 = Game.create!(televised: true,
                              stadium_name: "Mile High",
                              attendance: 30000,
                              created_at: "Tues Jun 03 12:35:19 -0700 2008")
        game_3 = Game.create!(televised: true,
                              stadium_name: "Mile High",
                              attendance: 30000,
                              created_at: "Wed Jun 04 12:35:19 -0700 2008")

        expected = [game_3, game_2, game_1]

        expect(Game.order_by_created_date).to eq(expected)
      end
    end
  end
end
