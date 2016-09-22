require 'spec_helper'

describe 'Player' do

  let(:player) { Player.new }
  let(:dice) { Die.new }

  context 'start of game' do
    it 'can be given a unique name to identify it by' do
      player.name = "Player1"
      expect(player.name).to eq('Player1')
    end

    it 'starts with a money total of 100' do
      expect(player.money).to eq(100)
    end

    it 'starts with a value of 0 for bet' do
      expect(player.bet).to eq(0)
    end
  end

  context 'placing a bet' do
    let(:money) { money = 100 }

    it 'can place a bet' do
      expect{player.place_bet(10)}.to change{player.bet}.from(0).to (10)
    end

    it 'is not able to place a bet that is greater than money available' do
      expect(player.bet_valid?(110)).to be false
    end
  end

  context 'receiving winnings' do
    let(:money) { money = 100 }

    it 'totals the winnings and remaining money when the winnings are positive' do
      winnings = 20
      expect{player.calculate_new_total(winnings)}.to change{player.money}.from(100).to (120)
    end

    it 'totals the winnings and remaining money when the winnings are negative' do
      winnings = -20
      expect{player.calculate_new_total(winnings)}.to change{player.money}.from(100).to (80)
    end
  end
end
