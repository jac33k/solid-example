class BusNotification
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def push
    "Next stop at: #{next_stop.arrival_time}"
  end

  private
  def next_stop
    bus_stops.each do |bus_stop|
      unless bus_stop.arrival_time < Time.now
        return bus_stop
      end
    end
  end
end

#=> Next stop at: 10:02

class BusNotification
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def push
    "Next stop is #{next_stop.name} at: #{next_stop.arrival_time}"
  end

  def push1
    ...
  end

  private
  def next_stop
    bus_stops.each do |bus_stop|
      unless bus_stop.arrival_time < Time.now
        return bus_stop
      end
    end
  end
end

class DetailedBusNotification < BusNotification
  def push
    "Next stop is #{next_stop.name} at: #{next_stop.arrival_time}"
  end
end
