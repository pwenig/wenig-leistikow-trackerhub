class ProjectsController < ApplicationController

  def index
    @projects = TrackerApi.new(ENV['PAUL_TRACKER_TOKEN']).get_projects
  end

end