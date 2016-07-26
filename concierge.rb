class Concierge
  attr_reader :lockers
  attr_writer :lockers
  
  def initialize
    @lockers = []

    (0...1000).each do |i|
      @lockers[i] = Locker.new(i, :small)
    end
    (1000...2000).each do |i|
      @lockers[i] = Locker.new(i, :medium)
    end
    (2000...3000).each do |i|
      @lockers[i] = Locker.new(i, :large)
    end
  end

  def put_bag(size)
    bag = Bag.new(size)
    case size
    when :small
      start = 0
    when :medium
      start = 1000
    when :large
      start = 2000
    else
      raise ArgumentError, "Bag size is invalid"
    end

    (start...start+1000).each do |i|
      locker = lockers[i]
      if locker.available? && locker.fits_bag?(bag)
        locker.bag = bag
        ticket = locker.id + 1
        return ticket
      end
    end
  end

  def get_bag(ticket)
    locker = lockers[ticket-1]
    return unless locker.bag
    bag = locker.bag
    locker.bag = nil
    bag
  end
end
