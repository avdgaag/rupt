module Rupt
  class Config
    USER_CONFIG_FILE    = File.expand_path('~/.rupt')
    PROJECT_CONFIG_FILE = './.rupt'

    class << self
      def set_project(id)
        File.open(project_config_file, 'w') do |f|
          f.write id
        end
      end

      def set_token(token)
        File.open(USER_CONFIG_FILE, 'w') do |f|
          f.write token
        end
      end

      def project_config_file
        path = PROJECT_CONFIG_FILE
        path = File.join('..', path) until File.exist?(path) || File.expand_path(path) == '/'
        if File.expand_path(path) == USER_CONFIG_FILE
          raise "Create project configuration file with `rupt project`"
        end
        path
      end
    end

    def initialize(api_token = nil, project_id = nil)
      @api_token  = api_token
      @project_id = project_id
    end

    def api_token
      raise "Authenticate with `rupt auth` first" unless File.exist?(USER_CONFIG_FILE)
      @api_token ||= File.read(USER_CONFIG_FILE).chomp
    end

    def project_id
      puts File.expand_path(self.class.project_config_file)
      @project_id ||= File.read(self.class.project_config_file).chomp
    end
  end
end
