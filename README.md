# ATM Challenge

This is the week 1 challenge of the Craft Academy Bootcamp. The challenge is to simulate an ATM-machine. Ruby is the main programing language used



### Usage
It is important that all the tests that we have created remains in place and it is important that you also do manual testing in `irb`.

Open up `irb` and run the following commands:

```irb
2.2.1 :002 > load './lib/atm.rb'
 => true
2.2.1 :003 > load './lib/person.rb'
 => true
2.2.1 :004 > load './lib/account.rb'
 => true
 ```
```irb
# Create person
2.2.1 :005 > duppe = Person.new(name: 'Duppe')
 => #<Person:0x007f8b4a889820 @name="Duppe", @cash=0>
# Create account
2.2.1 :006 >  acc = Account.new(owner: 'Duppe')
 => #<Account:0x007f8b4a82a820 @pin_code=5743, @exp_date="08/21", @account_status=:active, @owner="Duppe", @balance=0>
# Create an ATM
2.2.1 :007 > atm = Atm.new
 => #<Atm:0x007f8b4a8225d0 @funds=1000>
```

```irb
#create Account
duppe.create_account
 => #<Account:0x007f8b498587d0 @pin_code=6447, @exp_date="08/21", @account_status=:active, @owner=#<Person:0x007f8b4a889820 @name="Duppe", @cash=0, @account=#<Account:0x007f8b498587d0 ...>>, @balance=0>
#deposit 100 money
2.3.0 :022 > duppe.deposit(100)
=> 100
```

```irb
# Withdraw funds from account
2.2.1 :015 > duppe.withdraw(amount: 50, account: acc, atm: atm, pin: 6447)
 => 50
2.2.1 :015 > duppe.cash
 => 50
 # Account balance is 0... So something
2.2.1 :016 > duppe.account.balance
=> 50
 2.2.1 :017 > atm.funds
=> 950
```
