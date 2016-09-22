require 'spec_helper'

describe 'lucky7' do

  let(:lucky7) { Lucky7.new }
  let(:dice) { Dice.new }

  context 'when game begins' do
    it 'has two dices' do
      expect(lucky7.dice_collection.count).to eq(2)
    end
  end

  context 'playing the game' do
    it 'a player can roll the dice' do
      expect(lucky7.player_action).to change(dice.value)
    end
  end

end
