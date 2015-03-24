class BusNotification
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def push
    "Next stop at: #{next_stop.arrival_time}"
  end

  def to_json
    raise NotYetImplemented
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

  def to_json
    { next_stop.start => next_stop.arrival_time }.to_json
  end
end
