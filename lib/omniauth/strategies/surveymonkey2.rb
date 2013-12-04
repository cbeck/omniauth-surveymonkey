require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Surveymonkey2 < OmniAuth::Strategies::OAuth2

      option :name, "surveymonkey2"

      option :client_options, {
        :site => "https://api.surveymonkey.com",
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      option :authorize_options, [:api_key]
      
      def callback_phase
        options[:client_options][:token_url] = "/oauth/token?api_key=#{options[:api_key]}"
        super
      end

    end
  end
end
