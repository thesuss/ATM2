require './lib/atm.rb'
require './lib/account.rb'


describe Account do
  it 'is expected to have an expiry date on initialize' do
    # Here we set the validity of the card to 5 yrs as default
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end
end
