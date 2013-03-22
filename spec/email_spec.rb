require 'spec_helper'

describe Email do 

let(:email) {Email.new(address: 'mfpiccolo@gmail.com', subject: 'dude! you rock!', message: 'you are learning this stuff inside & out')}
let(:get_all_stub) {stub_request(:get, "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN_NAME}.mailgun.org/log")}

  context 'initialize' do 
    it 'initializes with options as a hash' do 
      email.should be_an_instance_of Email
    end
  end

  context 'readers' do
    it 'returns the address' do
      email.address.should eq 'mfpiccolo@gmail.com'
    end
     it 'returns the subject' do
      email.subject.should eq 'dude! you rock!'
    end
     it 'returns the message' do 
      email.message.should eq 'you are learning this stuff inside & out'
    end
  end

  context '.all' do
    it 'GETs all (if <= 100) sent messages' do
      stub = get_all_stub
      Email.all
      stub.should have_been_requested
    end
  end

  context '#send' do
    it 'sends an email and checks for the request' do
      email
      stub = stub_request(:post, "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN_NAME}.mailgun.org/messages")
      email.send_email
      stub.should have_been_requested
    end
  end





end
  