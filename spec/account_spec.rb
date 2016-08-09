require './lib/atm.rb'
require './lib/account.rb'


describe Account do


    # we create the double in our `describe` block and give him one sigle attribute
    let(:person) {instance_double('Person', name: 'DuPont')}
    # and modify our `subject`
    subject { described_class.new({owner: person}) }


  it 'is expected to have an expiry date on initialize' do
    # Here we set the validity of the card to 5 yrs as default
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  #instance pga mindre text
  it 'deactivates account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An Account owner is required'
  end
end
