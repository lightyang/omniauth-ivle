require "omniauth"
require "faraday"
require "multi_json"

module OmniAuth
  module Strategies
    class IVLE
      include OmniAuth::Strategy

      option :login_url, "https://ivle.nus.edu.sg/api/login/"
      option :profile_url, "https://ivle.nus.edu.sg/api/Lapi.svc/Profile_View"
      option :api_key, nil

      def request_phase
        redirect "#{options.login_url}?apikey=#{options.api_key}&url=#{callback_url}"
      end

      uid do
        profile["UserID"]
      end

      info do
        { name: profile["Name"], email: profile["Email"] }
      end

      extra do
        { profile: profile }
      end

      # fetch user profile
      def profile
        token = request.params["token"]
        profile_url = "#{options.profile_url}?APIKey=#{options.api_key}&AuthToken=#{token}"

        conn = Faraday.new(url: profile_url)
        response = conn.get
        json = MultiJson.decode(response.body)
        json["Results"][0]
      end

    end
  end
end
