# Skydrive

Simple client library for Microsoft Skydrive API with OAuth2 authentication

## Installation

Add this line to your application's Gemfile:

    gem 'skydrive'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skydrive

## Usage

### OAuth2 Authentication
  
  Skydrive uses OAuth2 authentication. First you will have to initialize a Skydrive::Oauth::Client object with the client id, client secret, callback url and scopes [(explained here)](http://msdn.microsoft.com/en-us/library/live/hh243646.aspx)

    oauth_client = Skydrive::Oauth::Client.new("your_client_id", "your_client_secret", "http://yourcallbackurl", "wl.skydrive_update,wl.offline_access")

  Obtain the authentication url 

    auth_url = oauth_client.authorize_url

  Redirect the user to the above obtained auth_url. After user gives access to your app, they will be redirected to the callback url with a 'code' parameter. Extract this code and get the access token by invoking the following method

    access_token = oauth_client.get_access_token("the_extracted_code")


### Instantiate a client
  
  After getting the access token instantiate the Skydrive client

    client = Skydrive::Client.new(:access_token => "your_acess_token")



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
