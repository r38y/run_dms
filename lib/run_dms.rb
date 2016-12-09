require 'net/https'
require 'uri'

class RunDMS
  def self.snitch(id, options={}, &block)
    dead_man = new(id, options)
    block.call
    dead_man.snitch
  end

  def initialize(id, options={})
    @actually_snitch = !!options.delete(:if)
    if @actually_snitch
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

  def snitch
    if @actually_snitch
      Rails.logger.info "***** Actually snitching! #{@id}"
      http.get(uri.request_uri)
    end
  end
end