require 'spec_helper'

describe 'Die' do

  let(:dice1) { Die.new }
  let(:dice2) { Die.new }

  context 'start of game' do
    it 'has an initial value of 0' do
      expect(dice1.value).to eq(0)
    end
  end

  context 'when dice is rolled' do
    it 'has a value between 1 and 6' do
      dice1.roll
      expect(dice1.value).to be_between(1, 6)
    end

    it 'stores a value after it is rolled' do
      expect{dice1.roll}.to change{dice1.value}.from(0).to be_between(1, 6)
    end
  end
end
