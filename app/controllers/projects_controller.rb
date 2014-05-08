class ProjectsController < ApplicationController

  def index
    @projects = TrackerApi.new(ENV['TRACKER_TOKEN']).get_projects
  end

  def show
    story_id = params[:id]
    @stories = TrackerApi.new(ENV['TRACKER_TOKEN']).get_stories(story_id)
    @comments = TrackerApi.new(ENV['TRACKER_TOKEN']).comments(story_id)
  end

end