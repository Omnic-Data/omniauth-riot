# OmniAuth Bnet

[![Gem
Version](https://badge.fury.io/rb/omniauth-bnet.svg)](http://badge.fury.io/rb/omniauth-bnet)

This is an OmniAuth strategy for authenticating to Riot's OmniAuth RSO client
service. In order to use it you need to register an application at the
[Riot Developer Portal](https://developer.riotgames.com/)

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-riot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-riot

## Usage

    use OmniAuth::Builder do
        provider :riot, ENV['RIOT_KEY'], ENV['RIOT_SECRET']
    end

### Scopes

In order to provide a list of scopes to request from riot:

    use OmniAuth::Builder do
        provider :riot, ENV['RIOT_KEY'], ENV['RIOT_SECRET'], scope: "wow.profile,sc2.profile"
    end

## License

[The MIT License](http://opensource.org/licenses/MIT)
