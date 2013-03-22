require 'faraday'

'https://api.mailgun.net/v2/mydomain.com'
'https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0@api.mailgun.net/v2/samples.mailgun.org/log'

API_URL = 'https://api.mailgun.net/v2'

'dorrit.epicodus.mailgun.org'


# address_uri = URI.encode_www_form({'from' => "dorrit.epicodus.mailgun.org", 'to' => 'mfpiccolo@gmail.com', 'subject' => 'whatever', 'text' => 'Some stuff.'})
# get_response = Faraday.post do |request| 
#   request.url "/dorrit.mailgun.org/log
# " 
# end


 

end
 

 
params = {
  :from => 'dorritgeshuri@gmail.com',
  :to => 'mfpiccolo@gmail.com',
  :subject => 'Hello',
  :text => 'Testing some Mailgun from OpenShift!'
}
 
