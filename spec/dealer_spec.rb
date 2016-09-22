require 'spec_helper'

describe 'Dealer' do

  context 'calculating whether the player wins or loses money' do

    let(:player) { Player.new }
    let(:dealer) { Dealer.new }

    before do
      dealer.receive_bet(10)
    end

    let(:greater_than_roll) { dice_roll = 8 }
    let(:less_than_roll) { dice_roll = 4 }
    let(:equal_roll) { dice_roll = 7 }

    context 'the player has chosen equal' do
      it 'multiplies the bet by 6 if the dice is 7' do
        choice = 7
        expect(dealer.calculate_winnings(equal_roll, choice)).to eq(60)
      end

      it 'the bet will be lost if the dice is NOT equal to 7' do
        choice = 7
        expect(dealer.calculate_winnings(greater_than_roll, choice)).to eq(-10)
      end
    end

    context 'the player has chosen greater than 7' do
      it 'doubles the bet if the dice is greater than 7' do
        choice = 8
        expect(dealer.calculate_winnings(greater_than_roll, choice)).to eq(20)
      end

      it 'subtracts the bet from the total if the dice is NOT greater than 7' do
        choice = 8
        expect(dealer.calculate_winnings(equal_roll, choice)).to eq(-10)
      end
    end

    context 'the player has chosen less than 7' do
      it 'doubles the bet if the dice is less than 7' do
        choice = 2
        expect(dealer.calculate_winnings(less_than_roll, choice)).to eq(20)
      end

      it 'subtracts the bet from the total if the dice is NOT less than 7' do
        choice = 2
        expect(dealer.calculate_winnings(greater_than_roll, choice)).to eq(-10)
      end
    end
  end
end
