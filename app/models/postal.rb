require "net/https"
require 'json'

class Postal
  def initialize(postal_code)
    @postal_code = postal_code
  end

  API_URI = "http://zipcloud.ibsnet.co.jp/api/search"

  def search
    uri = URI.parse(API_URI)
    uri.query = URI.encode_www_form({zipcode: @postal_code})
    req = Net::HTTP::Get.new(uri.request_uri)
    res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }
    json = JSON.parse(res.body)
    location = json["results"][0]
    location["address1"] + location["address2"] + location["address3"]
  end
end

