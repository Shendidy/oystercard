require './lib/oystercard'

RSpec.describe Oystercard do
  it 'checks that a new card has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'check we can start with non default balance' do
    expect(Oystercard.new(20).balance).to eq 20
  end
end
