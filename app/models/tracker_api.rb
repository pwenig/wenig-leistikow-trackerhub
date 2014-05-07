require 'faraday'
require 'json'

class TrackerApi
  def initialize(token)
    #use faraday to connect to Tracker API
    @token = token
    @conn = Faraday.new(:url => "https://www.pivotaltracker.com") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_projects
    response = @conn.get do |req|
      req.headers['X-TrackerToken'] = @token
      req.url '/services/v5/projects'
    end
    JSON.parse(response.body)
  end

end