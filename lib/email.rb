class Email
  include ActiveModel::Validations
  include MailWrap

  attr_reader :address, :subject, :message

  def initialize(options)
    @address = options[:address]
    @subject = options[:subject]
    @message = options[:message]
  end

  def self.all
    conn.get("#{DOMAIN_NAME}.mailgun.org/log")
  end


  def send_email
    params = {
      :from => USER_EMAIL,
      :to => @address,
      :subject => @subject,
      :text => @message
        }
    response = conn.post("#{DOMAIN_NAME}.mailgun.org/messages", params)
    response.success?
  end


end

