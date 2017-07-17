module ApiAiRuby
  class UserSay
    attr_accessor :data, :isTemplate, :count

    # @param data [Array]
    # @param isTemplate [Boolean]
    # @param count [Integer]
    def initialize (data, isTemplate, count)
      @data       = data
      @isTemplate = isTemplate
      @count      = count
    end

    def to_json(*args)
      {
        :data       => data,
        :isTemplate => isTemplate,
        :count      => count
      }.to_json(*args)
    end

    def add_data(text, alias, meta)
      @data.push new ApiAiRuby::UserSayData(text, alias, meta)
    end
  end
end
