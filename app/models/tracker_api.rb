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

  def get_stories(id)
    response = @conn.get do |req|
      req.headers['X-TrackerToken'] = @token
      req.url "/services/v5/projects/#{id}/stories"
    end
    JSON.parse(response.body)
  end

  def comments(project_id)
    list_of_stories = get_stories(project_id)
    all_comments = []
    # iterate through each story, get array of comments for each story
    list_of_stories.each do |story|
      response = @conn.get do |req|
        req.headers['X-TrackerToken'] = @token
        req.url "/services/v5/projects/#{project_id}/stories/#{story['id']}/comments"
      end
      #response = array of comments(hash)
      list_of_comments = JSON.parse(response.body)
      list_of_comments.each do |comment|
        all_comments << comment
      end
    end
   all_comments
  end
end