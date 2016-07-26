require './locker'
require './bag'
require './concierge'

concierge = Concierge.new

while true do 
  puts "Please enter a bag size or a ticket number"
  result = gets.strip
  if !/\A\d+\z/.match(result)
    size = result.to_sym
    ticket = concierge.put_bag(size)
    if ticket
      puts "Your bag's locker ticket is '#{ticket}'"
    else
      puts "Sorry, there are no lockers for that size available"
    end
  else
    ticket = result.to_i
    bag = concierge.get_bag(ticket)
    if bag
      puts "Your #{bag.size} bag has been returned"
    else
      puts "Sorry, no bag with that ticket number #{ticket} can be found"
    end
  end
end
