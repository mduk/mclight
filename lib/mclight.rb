require 'mclight/version'
require 'minecraft-query'
require 'wiringpi'
require 'ruby-mpd'

module Mclight

  class Runner
    def execute!
      led1 = Light.new( 1 )
      led2 = Light.new( 4 )

      Minecraft.new( 'minecraft.kendell.org.uk', led1 ).update
      Mpd.new( 'holly.local', led2 ).update
    end
  end

  class Light

    def initialize( pin )
      @pin = pin

      @io = WiringPi::GPIO.new
      @io.mode(@pin, OUTPUT)
    end

    def on
      @io.write( @pin, 1 )
    end

    def of
      @io.write( @pin, 0 )
    end

  end

  class Mpd

    def initialize( server, light )
      @server = server
      @light = light

      @mpd = MPD.new( @server )
      @mpd.connect
    end

    def update
      if @mpd.stopped?
        @light.off
      else
        @light.on
      end
    end
  end

  class Minecraft

    def initialize( server, light )
      @server = server
      @light = light
    end

    def update
      q = Query::simpleQuery( @server, 25565 )

      if q[:numplayers] == "0"
        @light.off
      else
        @light.on
      end
    end

  end

end
