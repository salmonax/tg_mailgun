class Unsubscriber
  include MailWrap

  def initialize(options)
    @address = options['address']
    @tag = options['tag']
  end

  def add
    params = { :address => @address, :tag => @tag }      
    conn.post("#{DOMAIN_NAME}.mailgun.org/unsubscribes", params)
  end

  def delete
    params = { :address => @address, :tag => @tag }      
    conn.delete("#{DOMAIN_NAME}.mailgun.org/unsubscribes", params)
  end

  def self.all
    conn.get("#{DOMAIN_NAME}.mailgun.org/unsubscribes")
  end

end
