require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Surveymonkey2 < OmniAuth::Strategies::OAuth2

      DEFAULT_RESPONSE_TYPE = 'code'
      DEFAULT_GRANT = 'authorization_code'

      option :name, "surveymonkey2"

      option :client_options, {
        :site => "https://api-surveymonkey-com-fytofsd4ktc2.runscope.net",
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      option :authorize_options, [:client_id, :api_key]

      def authorize_params
        super.tap do |params|
          params[:response_type] ||= DEFAULT_RESPONSE_TYPE
          params[:client_id] = options[:client_id]
          params[:api_key] = options[:api_key]
        end
      end

      def token_params
        super.tap do |params|
          params[:grant_type] ||= DEFAULT_GRANT
          params[:client_id] = options[:client_id]
          params[:client_secret] = options[:client_secret]
          params[:redirect_uri] = callback_url
        end
      end

      def build_access_token
        verifier = request.params['code']
        token = client.auth_code.get_token(verifier, token_params)
      end
      
      def callback_phase
        options[:client_options][:token_url] = "/oauth/token?api_key=#{options[:api_key]}"
        self.access_token = build_access_token
        self.env['omniauth.auth'] = auth_hash
        call_app!
      end

      info do
        {
          :token => self.access_token.token,
          :client => self.access_token.client.id
        }
      end
    end
  end
end
