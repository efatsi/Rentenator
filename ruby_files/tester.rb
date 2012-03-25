load 'rent_organizer.rb'

#eli = Member.new("Eli", 60)
#tom = Member.new("Tom", -40)
#brian = Member.new("Brian", -30)
#dinesh = Member.new("Dinesh", 20)
#paula = Member.new("Paula", -10)

#five_one = Family.new([eli, tom, brian, dinesh, paula])
## p five_one.size

#p "Neg balance"
#p five_one.negatives.map {|m| m.name + ": " + m.balance.to_s }
#p "Pos balance"
#p five_one.positives.map {|m| m.name + ": " + m.balance.to_s }
#p "Zero balance"
#p five_one.zeros.map {|m| m.name + ": " + m.balance.to_s }

#p five_one.even_it_up

# five_one.show_balances
# (1..4).each do 
# p "================="
# p five_one.make_check
# p "Neg balance"
# p five_one.negatives.map {|m| m.name + ": " + m.balance.to_s }
# p "Pos balance"
# p five_one.positives.map {|m| m.name + ": " + m.balance.to_s }
# p "Zero balance"
# p five_one.zeros.map {|m| m.name + ": " + m.balance.to_s }
# end


eli = Member.new("Eli")
tom = Member.new("Tom")
danka = Member.new("Danka")

us = Family.new([eli, tom, danka])

eli.pay_bill(60, us.family)
tom.pay_bill(72, us.family)
danka.pay_bill(3000, us.family)
p us.even_it_up
