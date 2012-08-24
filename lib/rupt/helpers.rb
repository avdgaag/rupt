module Rupt
  module Helpers
    def config(options = nil)
      @config ||= Rupt::Config.new(options.token, options.project_id)
    end

    def project(options)
      @project ||= Rupt::Project.new(config(options))
    end

    def use_id_or_choose(id, options, label)
      return id unless id == true
      choose_id(options, label)
    end

    def choose_id(options, label)
      l = choose('Choose one:', *options.map(&label))
      options.find { |o| o.send(label) == l }.id
    end

    def use_argument_or_ask_editor(arg, task)
      return arg unless arg == true || arg.nil?
      ask_editor_with_description(task)
    end

    def ask_editor_with_description(task)
      text = "#{task}\n\nLines starting with '#' will be removed."
      text.gsub! /^/, '# '
      ask_editor(text).gsub(/^#.+$/, '').strip
    end
  end
end
