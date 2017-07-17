module ApiAiRuby
  class Intent
    attr_accessor :name, :auto, :contexts, :templates, :userSays, :responses, :priority

    # @param name [String]
    # @param auto [Boolean]
    # @param contexts [Array]
    # @param templates [Array]
    # @param userSays [Array<ApiAiRuby::UserSay, Hash>]
    # @param responses [Array<ApiAiRuby::Response, Hash>]
    # @param priority [Integer]
    def initialize (name, auto, contexts, templates, userSays, responses, priority)
      @name      = name
      @auto      = auto
      @contexts  = contexts
      @templates = templates
      @userSays  = userSays
      @responses = responses
      @priority  = priority
    end

    def to_json(*args)
      {
          :name      => name,
          :auto      => auto,
          :contexts  => contexts,
          :templates => templates,
          :userSays  => userSays,
          :responses => responses,
          :priority  => priority

      }.to_json(*args)
    end

    def add_user_says(data, is_template, count)
      @userSays.push new ApiAiRuby::UserSay(data, is_template, count)
    end

    def add_responses(resetContexts, action, affectedContext, parameters, speech)
      @responses.push new ApiAiRuby::Response(resetContexts, action, affectedContext, parameters, speech)
    end

  end
end
