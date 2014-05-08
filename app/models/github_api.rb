class GithubApi

def comments(owner, repo, sha)
  @conn = Faraday.new(:url => "https://api.github.com") do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
  response = @conn.get do |req|
    req.headers['Authorization'] = "Basic Ymx1ZXZhanJhOjEwOEdpdEh1YjEqOA=="
    req.url "/repos/#{owner}/#{repo}/commits/#{sha}/comments"
  end
  JSON.parse(response.body)

  #https://api.github.com/repos/bluevajra/tibetan_dictionary/commits/1a1f4dd6d65fd09118313b0934d7e81a2f6b3c1b/comments
  #Authorization Basic Ymx1ZXZhanJhOjEwOEdpdEh1YjEqOA==
end

  def all_comments(project_id)
    #owner = "pwenig"
    #repo = "wenig-leistikow-trackerhub"
    #commit_sha = "66581363174e65bd08ecef48cdff04167e3b2373"

    #iterate through tracker comments
    #look to see if github commit was made
    #parse string for owner, repo, sha

      @repo = TrackerApi.new(ENV['TRACKER_TOKEN'])
      results = @repo.comments(project_id)
      puts results
      github_results = results.select do |project_comment|
        project_comment["text"].include?("https://github.com")
      end

      github_results.each do |git_result|
        #this gets the html string to parse
        git_result["text"].match(/https(.*?)[\[]/)[0]
        #owner =
        #repo =
        #sha =
      end
      #https://github.com/pwenig/wenig-leistikow-trackerhub/commit/c215ec8dcab561739928daede869a3cc6442bbd2\n

  end
end