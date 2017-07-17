module ApiAiRuby
  class AffectedContext
    attr_accessor :name, :lifespan

    # @param name [String]
    # @param lifespan [Integer]
    def initialize(name, lifespan)
      @name = name
      @lifespan = lifespan
    end

    def to_json(*args)
      {
        :name     => name,
        :lifespan => lifespan
      }.to_json(*args)
    end
  end
end
