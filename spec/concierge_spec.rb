require 'spec_helper'

RSpec.describe "Concierge" do
  before do
    @concierge = Concierge.new
  end

  describe '#initialize' do
    it 'should create 1000 small lockers' do
      count = @concierge.lockers.count { |l| l.size == :small }
      expect(count).to eq(1000)
    end

    it 'should create 1000 medium lockers' do
     count = @concierge.lockers.count { |l| l.size == :medium }
    expect(count).to eq(1000)
    end

    it 'should create 1000 large lockers' do
      count = @concierge.lockers.count { |l| l.size == :large }
      expect(count).to eq(1000)
    end
  end

  describe '#put_bag' do
    it "should raise an ArgumentError error if an incorrect size is given" do
      expect { @concierge.put_bag(:wrong) }.to raise_error(ArgumentError)
    end

    context 'there are lockers of the given size available' do
      before do
        @concierge.lockers[0].bag = Bag.new(:small)
      end

      it 'should put the bag in the first available locker and return the id' do
        expect(@concierge.put_bag(:small)).to eq(2)
        expect(@concierge.lockers[1]).to_not eq(nil)
      end
    end

    context 'there are no lockers of the given size available' do
      before do
        (0...1000).each do |i|
          @concierge.lockers[i].bag = Bag.new(:small)
        end
      end

      it 'should return nil' do
        expect(@concierge.put_bag(:small))
      end
    end
  end

  describe '#get_bag' do
    context 'there is a bag matching the ticket number' do
      before do
        @bag = Bag.new(:small)
        @concierge.lockers[0].bag = @bag
      end

      it 'should return the bag and clear the locker' do
        expect(@concierge.get_bag(1)).to eq(@bag)
        expect(@concierge.lockers[0].bag).to eq(nil)
      end
    end

    context 'there is no bag matching the ticket number' do
      it 'should return nil' do
        expect(@concierge.get_bag(1)).to eq(nil)
      end
    end
  end
end
