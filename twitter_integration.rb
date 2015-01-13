require 'twitter'

###################
#Request Structure
###################

# {
#   "tweet"=> {
#     "body"=>"Hello from Wombat"
#   },
#   "parameters"=> {
#     "consumer_key"=>"",
#     "consumer_secret"=>"",
#     "access_token"=>"",
#     "access_token_secret"=>""
#   },
#   "request_id"=>""
# }

class TwitterIntegration < EndpointBase::Sinatra::Base

  #send tweet webook
  post '/send_tweet' do

    #create client with credentials
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = @config['consumer_key']
      config.consumer_secret     = @config['consumer_secret']
      config.access_token        = @config['access_token']
      config.access_token_secret = @config['access_token_secret']
    end

    #create tweet
    client.update @payload[:tweet]['body']

    #response
    result 200, "Succesfully Sent Tweet"
  end
end