# Skydrive

Simple client library for Microsoft Skydrive API with OAuth2 authentication

## Installation

Add this line to your application's Gemfile:

    gem 'skydrive'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skydrive

## Initial steps

### OAuth2 Authentication

  Skydrive uses OAuth2 authentication. First you will have to initialize a Skydrive::Oauth::Client object with the client id, client secret, callback url and scopes [(explained here)](http://msdn.microsoft.com/en-us/library/live/hh243646.aspx)

    oauth_client = Skydrive::Oauth::Client.new("your_client_id", "your_client_secret", "http://yourcallbackurl", "wl.skydrive_update,wl.offline_access")

  Obtain the authentication url

    auth_url = oauth_client.authorize_url

  Redirect the user to the above obtained auth_url. After user gives access to your app, they will be redirected to the callback url with a 'code' parameter. Extract this code and get the access token by invoking the following method

    access_token = oauth_client.get_access_token("the_extracted_code")

  If you have already stored the access_token details somewhere, you can instantiate the access token without having to authorize again. But this might require you to store the refresh token(if scope 'wl.offline_access' has been requested) as well.

    access_token = oauth_client.get_access_token_from_hash("access_token", {:refresh_token => "refresh_token", :expires_at => 1234567})


### Instantiate a client

  After getting the access token instantiate the Skydrive client

    client = Skydrive::Client.new(access_token)

## Usage

### Get the user's home folder

  To get the details about the acting user's home folder
    folder = client.my_skydrive

  This returns a Skydrive::Folder object.

  Please refer to the documentation for full details about the operations

## Features

1. Every thing is an object. For eg: Skydrive::Folder, Skydrive::File
2. I have introduced a new object Skydrive::Collection when the result contains multiple type objects
3. Downloading files have been enabled

## Todo

1. File upload
2. More specs

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
