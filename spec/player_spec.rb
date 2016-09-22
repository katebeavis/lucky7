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

    it 'players can place a bet' do
      expect{player.place_bet(10)}.to change{player.bet}.from(0).to (10)
    end

    it 'does not let a user place a bet that is greater than money available' do
      expect(player.bet_valid?(110)).to be false
    end
  end

  context 'calculating whether the player wins or loses money' do

    before do
      player.place_bet(10)
    end

    let(:greater_than_roll) { dice_roll = 8 }
    let(:less_than_roll) { dice_roll = 4 }
    let(:equal_roll) { dice_roll = 7 }

    context 'the player has chosen equal' do
      it 'multiplies the bet by 6 if the dice is 7' do
        choice = 7
        expect{player.calculate_new_total(equal_roll, choice)}.to change{player.money}.from(100).to (160)
      end

      it 'subtracts the bet from the total if the dice is NOT than 7' do
        choice = 7
        expect{player.calculate_new_total(greater_than_roll, choice)}.to change{player.money}.from(100).to (90)
      end
    end

    context 'the player has chosen greater than 7' do
      it 'doubles the bet if the dice is greater than 7' do
        choice = 8
        expect{player.calculate_new_total(greater_than_roll, choice)}.to change{player.money}.from(100).to (120)
      end

      it 'subtracts the bet from the total if the dice is NOT greater than 7' do
        choice = 8
        expect{player.calculate_new_total(equal_roll, choice)}.to change{player.money}.from(100).to (90)
      end
    end

    context 'the player has chosen less than 7' do
      it 'doubles the bet if the dice is less than 7' do
        choice = 2
        expect{player.calculate_new_total(less_than_roll, choice)}.to change{player.money}.from(100).to (120)
      end

      it 'subtracts the bet from the total if the dice is NOT less than 7' do
        choice = 2
        expect{player.calculate_new_total(greater_than_roll, choice)}.to change{player.money}.from(100).to (90)
      end
    end
  end
end
