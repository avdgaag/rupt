module Rupt
  class Project
    attr_reader :project

    def initialize(config)
      PivotalTracker::Client.token = config.api_token
      puts config.project_id.inspect
      @project = PivotalTracker::Project.find(config.project_id)
    end

    def story(id)
      Story.new(project.stories.find(id))
    end

    def stories(filter_options = {})
      project.stories.all(filter_options).map(&Story.public_method(:new))
    end

    def current_stories
      project.iterations.current(project).stories.map(&Story.public_method(:new))
    end
  end
end
