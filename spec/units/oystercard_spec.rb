require './lib/oystercard'

RSpec.describe Oystercard do
  context "Initial tests" do
    it 'checks that a new card has a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'check we can start with non default balance' do
      expect(Oystercard.new(20).balance).to eq 20
    end

    it 'responds to top_up' do
      is_expected.to respond_to(:top_up)
    end

    it 'is expected to top up balance when required' do
      oycard = Oystercard.new
      oycard.top_up(20)
      expect(oycard.balance).to eq 20
    end

    it 'raise error when balance exceeds £90' do
      oycard = Oystercard.new
      expect {oycard.top_up(100)}.to raise_error("Exceeded max balance of #{oycard.Max_Balance}!")
    end

    it 'is expected to deduct jurney rate when instructed to' do
      oycard = Oystercard.new
      oycard.top_up(20)
      expect(oycard.deduct(5)).to eq(15)
    end
  end

  context "touching in & out starting with £50" do
    new_card = Oystercard.new(50)
    it "checking in_journey?" do
      expect(new_card.in_journey?).to eq false
    end

    it "checking touch_in" do
      expect(new_card.touch_in).to eq true
    end

    it "checking touch_out" do
      expect(new_card.touch_out).to eq false
    end
  end
end
