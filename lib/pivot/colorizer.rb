module Pivot
  module Colorizer
    def type(str)
      color = case str
              when /feature/ then :green
              when /bug/     then :red
              when /chore/   then :magenta
              when /release/ then :blue
              else
                :gray
              end
      str.send(color)
    end

    def state(str)
      color = case str
              when /unscheduled|unstarted/i then :gray
              when /started/i   then :blue
              when /delivered/i then :magenta
              when /accepted/i  then :green
              when /rejected/i  then :red
              when /finished/i  then :yellow
              else
                :gray
              end
      str.send(color)
    end

    extend self
  end
end
