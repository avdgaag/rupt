module Pivot
  class ListFormatter
    attr_reader :hash

    def initialize(hash)
      @hash = hash
    end

    def to_s
      max_length = hash.keys.map(&:size).max
      hash.map { |k, v| [k.ljust(max_length).gray, v].join(' ') }.join("\n")
    end
  end
end
