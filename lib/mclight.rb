require 'mclight/version'
require 'minecraft-query'
require 'wiringpi'

module Mclight

  class Runner
    def execute!
      Minecraft.new( 'minecraft.kendell.org.uk', Light.new( 1 ) ).update
      Light.new( 4 ).on
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
