require 'faraday'
require 'active_model'
require 'json'

require './env'
require './lib/mail_wrap'
require './lib/email'
require './lib/unsubscriber'










def welcome
  puts "\n\nWelcome to the Mailgun command-line email client."
  menu
end



def menu
  choice = nil
  until choice == 'e'
    puts "\n\nWhat would you like to do?"
    puts "Press 's' to send and email or 'm' to manage subscriptions"
    puts "Press 'e' to exit"

  case choice = gets.chomp
    when 's'
      send_ui
    when 'm'
      manage_subscriptions
    when 'l'
      list_sent
    when 'e'
      exit
    else
      invalid
    end
  end
end

def list_sent
  puts Outbox.all
end

def send_ui
  puts "\nEnter email address you would like to send to."
  address = gets.chomp
  puts "\nEnter the subject:"
  subject = gets.chomp
  puts "\nEnter the message:"
  message = gets.chomp
  email = Email.new(address: address, subject: subject, message: message)
  if email.send_email
    puts "\n Your email was sent to #{email.address}!"
  else
    puts "\n Your email failed #{email.address}."
  end
end

def manage_unsubscribers
  command = nil
  until command == exit
    print "unsubscribes:>> do: "
    command = gets.chomp
    case command
    when 'list'
      #puts Unsubscriber.all
    when 'add'

    end
  end
end


welcome