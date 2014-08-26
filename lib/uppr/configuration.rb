module Uppr
  class Configuration
    attr_accessor :default
    attr_writer :attachment, :image, :video

    def initialize
      @default = :file
      @attachment = nil
      @image = nil
      @video = nil
    end

    def attachment
      @attachment || default
    end

    def image
      @image || default
    end

    def video
      @video || default
    end
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield configuration
    end
  end
end