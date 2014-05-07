require 'spec_helper'
require 'pp'

describe TrackerApi do
  describe "getting projects" do
    it "returns list of projects" do
      repo = TrackerApi.new(ENV['PAUL_TRACKER_TOKEN'])
      actual = repo.get_projects
      actual_mapped = actual.map{|project| project["name"]}
      expect(actual_mapped).to include("wenig and leistikow's Tracker hub")
      expect(actual_mapped).to include("URL Shortner")
    end
  end
end