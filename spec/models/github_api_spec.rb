require 'spec_helper'

describe GithubApi do
  describe "gets commments from commits" do
    it "returns list of comments" do
      VCR.use_cassette('pauls/projects/github', record: :all) do
        @repo = GithubApi.new
        owner = "pwenig"
        repo = "wenig-leistikow-trackerhub"
        commit_sha = "66581363174e65bd08ecef48cdff04167e3b2373"
        actual = @repo.comments(owner, repo, commit_sha)
        actual_mapped = actual.map { |comment| comment["body"] }
        expect(actual_mapped).to include("Great job.")
      end
    end
  end
  describe "gets all comments from commits associated with proejcts" do

    it "returns all comments from various commits" do
      VCR.use_cassette('pauls/projects/github/all', record: :all) do
        @repo = GithubApi.new
        #owner = "pwenig"
        #repo = "wenig-leistikow-trackerhub"
        #commit_sha = "66581363174e65bd08ecef48cdff04167e3b2373"
        #iterate through tracker comments
        #look to see if github commit was made
        #parse string for owner, repo, sha

        actual = @repo.all_comments(1075514)
        actual_mapped = actual.map { |comment| comment["body"] }
        expect(actual_mapped).to include("Great job.")
      end
    end
  end

end
