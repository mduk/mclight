require 'mclight/version'
require 'minecraft-query'
require 'wiringpi'

module Mclight

  class Runner
    def execute!
      Light.new( 'minecraft.kendell.org.uk', 11111, 1 ).update
    end
  end

  class Light

    def initialize( server, queryPort, pin )
      @server = server
      @queryPort = queryPort
      @pin = pin

      @io = WiringPi::GPIO.new
      @io.mode(@pin, OUTPUT)
    end

    def update
      q = Query::simpleQuery( @server, @queryPort )

      if q[:numplayers] == "0"
        @io.write( @pin, 0 )
      else
        @io.write( @pin, 1 )
      end
    end

  end

end
