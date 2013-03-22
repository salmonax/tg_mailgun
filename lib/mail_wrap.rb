module MailWrap
  def self.included receiver
    receiver.extend ClassMethods
  end

  module ClassMethods
    def conn
      connection = Faraday.new(:url => 'https://api.mailgun.net/v2') do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter 
      end
      connection.basic_auth('api', API_KEY)
      connection
    end
  end

  def conn
    connection = Faraday.new(:url => 'https://api.mailgun.net/v2') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter 
    end
    connection.basic_auth('api', API_KEY)
    connection
  end
end
