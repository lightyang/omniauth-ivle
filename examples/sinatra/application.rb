$:.push File.dirname(__FILE__) + "/../lib"

require "rubygems"
require "bundler"
Bundler.setup :default, :example, ENV["RACK_ENV"]

require "sinatra"
require "omniauth-ivle"

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :ivle, api_key: ENV["API_KEY"]
end

get "/" do
    '<a href="/auth/ivle">Auth with IVLE</a>'
end

get "/auth/ivle/callback" do
    content_type "text/plain"
    request.env["omniauth.auth"].to_hash.inspect
end
