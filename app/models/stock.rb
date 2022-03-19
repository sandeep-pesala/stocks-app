class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'Tpk_3cea1156f98a49b5a337aa05164208f1', secret_token: 'Tsk_4caec5ba779145de99b2e2c67ff4ab77', endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      details = client.quote(ticker_symbol)
      new(ticker: details['symbol'], name: details['company_name'], last_price: details['close'] )
    rescue => exception
      return nil 
    end
  end
end
