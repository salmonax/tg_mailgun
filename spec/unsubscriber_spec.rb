require 'spec_helper'

describe Unsubscriber do 

  let(:unsubscriber) {Unsubscriber.new(address: 'mfpiccolo@gmail.com')}
  let(:add_stub) { stub_request(:post, "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN_NAME}.mailgun.org/unsubscribes") }
  let(:delete_stub) { stub_request(:delete, "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN_NAME}.mailgun.org/unsubscribes") }
  let(:all_stub) { stub_request(:get, "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN_NAME}.mailgun.org/unsubscribes") }
  
  context '#add' do 
    it 'adds an email to the unsubscribe list' do 
      stub = add_stub
      unsubscriber.add
      stub.should have_been_requested
    end
  end

  # context '#delete' do
  #   it 'deletes an unsubscriber from unsubscribes' do
  #     stub = delete_stub
  #     unsubscriber.delete
  #     stub.should have_been_requested
  #   end
  # end

  context '.all' do
    it 'requests the list of unsubscribers' do
      stub = all_stub
      Unsubscriber.all
      stub.should have_been_requested
    end


    it 'gives a list of everyone (name and email) who has been unsubscribed' do 
      VCR.use_cassette('view_unsubscribers') do
        #unsubscriber.view_unsubscribers.list.should eq ""
      end
    end
  end
end
