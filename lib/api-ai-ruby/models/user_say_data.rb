module ApiAiRuby
  class UserSayData
    attr_accessor :text, :alias, :meta

    # @param text  [String]
    # @param alias [String]
    # @param meta  [String]
    def initialize (text, data_alias, meta)
      @text  = text
      @alias = data_alias
      @meta  = meta
    end

    def to_json(*args)
      {
          :text  => text,
          :alias => data_alias,
          :meta  => meta
      }.to_json(*args)
    end
  end
end
