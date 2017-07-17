module ApiAiRuby
  class Response
    attr_accessor :resetContexts, :action, :affectedContexts, :parameters, :speech

    # @param resetContexts [Boolean]
    # @param action [String]
    # @param affectedContexts [Array<ApiAiRuby::AffectedContext, Hash>]
    # @param parameters [Array<ApiAiRuby::Parameter, Hash>]
    # @param speech [String]
    def initialize (resetContexts, action, affectedContexts, parameters, speech)
      @resetContexts    = resetContexts
      @action           = action
      @affectedContexts = affectedContexts
      @parameters       = parameters
      @speech           = speech
    end

    def to_json(*args)
      {
        :resetContexts    => resetContexts,
        :action           => action,
        :affectedContexts => affectedContexts,
        :parameters       => parameters,
        :speech           => speech
      }.to_json(*args)
    end

    def add_affected_contexts(name, lifespan)
      @affectedContexts.push new ApiAiRuby::AffectedContext(name, lifespan)
    end

    def add_parameters(dataType, name, value)
      @parameters.push new ApiAiRuby::Parameter(dataType, name, value)
    end

  end
end
