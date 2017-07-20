module ApiAiRuby
  class IntentsRequest < ApiAiRuby::RequestQuery

    def initialize(client,  options = {})
      super client, options
      @headers['Content-Type'] = 'application/json; charset=UTF-8'
      @crud_base_uri = client.api_base_url + 'intents'
    end

    # @param argument [Array<ApiAiRuby::Intent, Hash>, ApiAiRuby::Intent, Hash]
    # @return [Hash]
    def create(argument)
      if !(argument && (argument.is_a?(Array) || argument.is_a?(Hash) || argument.is_a?(ApiAiRuby::Intent)))
        raise ApiAiRuby::ClientError.new('Argument should be array of Intents or single Intent object')
      end
      @uri = @crud_base_uri
      @request_method = :post

      old_options = nil

      begin
        if argument.is_a?(ApiAiRuby::Intent)
          old_options = @options
          @options = argument
        else
          @options[:intents] = argument.is_a?(Array) ? argument : [argument]
        end

        response = self.perform

        @options.delete(:intents) if @options.respond_to? :delete
      rescue
        @options = old_options || @options
      end
      response
    end

    def retrieve(iid)
      raise ApiAiRuby::ClientError.new('Intent iid required') if !iid
      @request_method = :get
      @uri = @crud_base_uri + '/' + iid
      self.perform
    end

    def list
      @request_method = :get
      @uri = @crud_base_uri
      @options = nil
      self.perform
    end

    def update(iid, intent, extend = false)

      raise ApiAiRuby::ClientError.new('Intent iid required') if !iid

      @options[:extend]    = extend
      @options[:name]      = intent.name
      @options[:auto]      = intent.auto
      @options[:contexts]  = intent.contexts
      @options[:templates] = intent.templates
      @options[:userSays]  = intent.userSays
      @options[:responses] = intent.responses
      @options[:priority]  = intent.priority

      @request_method = :put
      @uri = @crud_base_uri + '/' + iid
      response = self.perform
      @options.delete(:extend)
      @options.delete(:name)
      @options.delete(:auto)
      @options.delete(:contexts)
      @options.delete(:templates)
      @options.delete(:userSays)
      @options.delete(:responses)
      @options.delete(:priority)
      response
    end

    def delete(iid)
      raise ApiAiRuby::ClientError.new('Intent iid required') if !iid
      @request_method = :delete
      @uri = @crud_base_uri + '/' + name
      self.perform
    end

  end
end
