require 'spec_helper'

describe 'Player' do

  let(:player) { Player.new }

  context 'start of game' do
    it 'can be given a unique name to identify it by' do
      player.name = "Player1"
      expect(player.name).to eq('Player1')
    end

    it 'starts with a money total of 100' do
      expect(player.money).to eq(100)
    end

    it "it assigns '< 7' inputs to a number less than 7" do
      input = "Less"
      expect(player.convert_choice_to_number(input)).to eq(1)
    end

    it "assigns '> 7' inputs to a number more than 7" do
      input = "Greater"
      expect(player.convert_choice_to_number(input)).to eq(8)
    end

    it "assigns '== 7' inputs to 7" do
      input = "Equal"
      expect(player.convert_choice_to_number(input)).to eq(7)
    end
  end
end
