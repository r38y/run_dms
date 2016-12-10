module RunDMS
  class Client
    def snitch
      if @cond
        debug("***** Actually snitching! #{@id}")
        http.get(uri.request_uri)
      end
    end

    private

    def initialize(id, cond: true, debug: false)
      @cond = cond
      @debug = debug
      if @cond
        raise ArgumentError unless id
        @id = id
        @start_time = Time.now
      end
    end

    def elapsed_time
      (Time.now - @start_time)
    end

    def uri
      @uri ||= URI.parse("https://nosnch.in/#{@id}?m=#{elapsed_time}+seconds")
    end

    def http
      Net::HTTP.new(uri.host, uri.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def debug(message)
      puts message
    end
  end
end
