require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class Riot < OmniAuth::Strategies::OAuth2
      option :region, 'us'
      option :client_options, {
        scope: 'openid'
      }

      def client
        # Map Jumpstart-style keys to standard OAuth2 keys
        options.client_id ||= options[:public_key] || options[:api_key]
        options.client_secret ||= options[:private_key]

        # Setup Riot OAuth2 endpoints
        options.client_options[:authorize_url] ||= "https://#{getHost(options.region)}/oauth/authorize"
        options.client_options[:token_url]     ||= "https://#{getHost(options.region)}/oauth/token"
        options.client_options[:site]          ||= "https://#{getHost(options.region)}/"

        super
      end

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            params[v.to_sym] = request.params[v] if request.params[v]
          end
        end
      end

      uid { raw_info['id'].to_s }

      info { raw_info }

      def raw_info
        return @raw_info if @raw_info

        access_token.options[:mode] = :query
        @raw_info = access_token.get('oauth/userinfo').parsed
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end

      def getHost(region)
        "auth.riotgames.com"
      end
    end
  end
end
