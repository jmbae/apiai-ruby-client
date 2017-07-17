module ApiAiRuby
  class Parameter
    attr_accessor :dataType, :name, :value

    # @param dataType [String]
    # @param name [String]
    # @param count [String]
    def initialize (dataType, name, value)
      @dataType = dataType
      @name     = name
      @value    = value
    end

    def to_json(*args)
      {
        :dataType => dataType,
        :name     => name,
        :value    => value
      }.to_json(*args)
    end
  end
end
