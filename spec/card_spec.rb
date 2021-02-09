require_relative '../lib/card.rb' 

describe Oystercard do 

  it "responds to balance method " do
      expect(subject).to respond_to(:balance)
  end 
  
  it "responds to 'top_up' method" do 
      expect(subject).to respond_to(:top_up).with(1).argument 
      expect(subject.top_up(1)).to be_integer
  end 
  
  describe '#top_up' do
    it 'should add money' do
      expect(subject.top_up(50)).to eq(50)
    end
    it 'should raise error if limit is reached' do
      MAX_BALANCE = Oystercard::MAX_BALANCE
      subject.top_up(MAX_BALANCE)
      expect {subject.top_up 1 }.to raise_error 'ERROR: Cannot add. Balance will exceed #{MAX_BALANCE}'
    end
  end

  describe '#deduct' do 
    it 'should deduct money' do
      subject.top_up(50)
      expect(subject.deduct(10)).to eq(40)
    end
  end
  
  describe '#touch_in, #touch_out & in_journey?' do 
    it "responds to touch_in" do 
      expect(subject).to respond_to(:touch_in)
      subject.top_up(50)
      subject.touch_in
      expect(subject).to be_in_journey
    end 
    it "prevents touch in if balance below £1" do 
      expect{subject.touch_in}.to raise_error("Insufficient Balance") 
    end 
    it "respond to touch_out" do 
      expect(subject).to respond_to(:touch_out) 
      subject.top_up(50)
      subject.touch_in
      expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end 
    it "responds to in_journey? " do 
      expect(subject).to respond_to(:in_journey?)
    end 
  end
end 

