$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'brewerydb'

def mock_httparty_response(parsed_response)
  request_object = HTTParty::Request.new Net::HTTP::Get, '/'
  response_object = Net::HTTPOK.new('1.1', 200, 'OK')
  response_object.stub(:body => "{foo:'bar'}")

  HTTParty::Response.new(request_object, response_object, parsed_response) 
end