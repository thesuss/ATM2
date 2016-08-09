require './lib/atm.rb'
describe Atm do

  let(:account) { class_double('Account', pin_code: '1234', exp_date: '04/17', account_status: :active) }

  before do
    # konotot måste ha 'balance' med 100 i det
    allow(account).to receive(:balance).and_return(100)
    # Kontot måste också kunna få pengar in
    allow(account).to receive(:balance=)
  end

  it 'has $1000 on intitialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw(50, '1234',  account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if account has enough balance.' do
      # Detta ska synas när det fungerar.
        expected_output = {
            status: true,
            message: 'success',
            date: Date.today,
            amount: 45,
            bills: [20, 20, 5]}
          # belopp och konto skjuts in i withdraw funktionen
      expect(subject.withdraw(45, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if account has insufficient funds' do
      expected_output = { status: true, message: 'insufficient funds', date: Date.today }
      #Det finns 100, så vi provar 105
      expect(subject.withdraw(105, '1234',  account)).to eq expected_output
    end

    it 'reject withdraw if ATM has insufficient funds' do
      #sänk nivån i maskinen och testa att ta ut mer än det finns.
      subject.funds = 50
      expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
      expect(subject.withdraw(100, '1234',  account)).to eq expected_output
    end

    #Inga pengar ska tas ut om kortet gått ut
    it 'reject withdraw if card is expired' do
      allow(account).to receive(:exp_date).and_return('12/15')
      expected_output = { status: false, message: 'card expired', date: Date.today }
      expect(subject.withdraw(6, '1234', account)).to eq expected_output
    end

    #Inga pengar ska tas ut om kontot är avstängt
    it 'reject withdraw if account is disabled' do
      #samma som ovan fast status ist f datumet och den ska då ge disabled ist f active
      allow(account).to receive(:account_status).and_return(:disabled)
      expected_output = { status: false, message: 'account disabled', date: Date.today }
      expect(subject.withdraw(4, '1234', account)).to eq expected_output
    end

end
