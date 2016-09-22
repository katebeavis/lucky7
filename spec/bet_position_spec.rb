require 'spec_helper'

describe 'BetPosition' do

  let(:bet_position) { BetPosition.new }

  context 'choosing a position' do

    it "it assigns '< 7' inputs to a number less than 7" do
      input = "Less than 7"
      expect(bet_position.convert_position_to_number(input)).to eq(1)
    end

    it "assigns '> 7' inputs to a number more than 7" do
      input = "Greater than 7"
      expect(bet_position.convert_position_to_number(input)).to eq(8)
    end

    it "assigns '== 7' inputs to 7" do
      input = "Equal"
      expect(bet_position.convert_position_to_number(input)).to eq(7)
    end

    it 'lets a user make a choice that is valid' do
      position = 'less than 7'
      expect(bet_position.position_valid?(position)).to eq true
    end

    it 'does NOT let a user make a choice that is NOT valid' do
      position = "something"
      expect(bet_position.position_valid?(position)).to eq false
    end
  end
end
