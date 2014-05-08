require 'spec_helper'
require 'pp'

describe TrackerApi do
  describe "getting projects" do

    it "returns list of projects" do
      VCR.use_cassette('pauls/projects') do
        @repo = TrackerApi.new(ENV['TRACKER_TOKEN'])
        actual = @repo.get_projects
        actual_mapped = actual.map { |project| project["name"] }
        expect(actual_mapped).to include("wenig and leistikow's Tracker hub")
        expect(actual_mapped).to include("URL Shortner")
      end
    end
    it "returns a list of stories for a project" do
      @repo = TrackerApi.new(ENV['TRACKER_TOKEN'])
      VCR.use_cassette('pauls/projects/url_shortener') do
        actual = @repo.get_stories(1047448)
        actual_mapped = actual.map { |story| story["name"] }
        expect(actual_mapped).to include("user tries to shorten a non-url")
      end
    end
    it "returns a list of comments for a project's stories" do
      VCR.use_cassette('pauls/projects/comments/url_shortener') do
        @repo = TrackerApi.new(ENV['TRACKER_TOKEN'])
        actual = @repo.comments(1047448)
        actual_mapped = actual.map { |comment| comment["text"] }
          expect(actual_mapped).to include("A great start. Please see if you can bump the button to be more centered under the text box. Don't spend more than 15 minutes on it.")
      end
    end
  end
end