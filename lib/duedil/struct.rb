module Duedil
  class Struct
    attr_reader :hash

    def initialize
      @hash = {}
    end

    def [](key)
      @hash[key]
    end

    def []=(key, value)
      @hash[key] = value
    end

    def method_missing(name, *args, &block)
      key = name.to_s.gsub(/_(\w)/) { $1.capitalize }

      if @hash.has_key?(key) && args.empty? && block.nil?
        @hash[key]
      else
        super name, *args, &block
      end
    end

    def respond_to_missing?(name, include_private = false)
      @hash.has_key?(name.to_s.gsub(/_(\w)/) { $1.capitalize })
    end

  end
end
