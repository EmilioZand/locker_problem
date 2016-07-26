require './locker'
require './bag'

RSpec.describe "Locker" do
  before do
    @locker = Locker.new(1, :small)
  end

  describe "#initialize" do
    it 'can take an id and sizeand initialize an object' do
      expect(@locker.id).to eq(1)
      expect(@locker.size).to eq(:small)
    end
  end

  describe "#availible" do
    it 'returns true if the locker has no bag' do
      expect(@locker.available?).to eq(true)
    end

    it 'returns false if the locker has a bag' do
      @locker.bag = Bag.new(:small)
      expect(@locker.available?).to eq(false)
    end
  end

  describe '#fits_bag?' do
    it 'returns true if the bag size matches the locker size' do
      bag = Bag.new(:small)
      expect(@locker.fits_bag?(bag)).to eq(true)
    end

    it 'returns false if the bag size does not match the locker size' do
      bag = Bag.new(:medium)
      expect(@locker.fits_bag?(bag)).to eq(false)
    end
  end
end
