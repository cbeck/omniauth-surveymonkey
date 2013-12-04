require 'omniauth-surveymonkey2'

describe OmniAuth::Strategies::Surveymonkey2 do
  
  subject do
    OmniAuth::Strategies::Surveymonkey2.new(nil, {}) 
  end

	describe '#client' do

    it 'has correct surveymonkey api site' do
      subject.options.client_options.site.should == ('https://api.surveymonkey.com')
    end

    it 'has correct access token path' do
      subject.options.client_options.token_url.should == ('/oauth/token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should == ('/oauth/authorize')
    end
  end

	describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should == ('/auth/surveymonkey2/callback')
    end
  end
end