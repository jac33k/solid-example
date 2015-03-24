class BusStop
  attr_reader :start, :destination, :time

  def initialize(start, destination, time)
    @start = start
    @destination = destination
    @time = time
  end

  def departure_time
    time["departure"]
  end

  def arrival_time
    time["arrival"]
  end
end

class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def calculate_travel_duration
    destination.arrival_time - start.arrival_time
  end

  def print
    bus_stops.collect(&:start)
  end

  private

  def start
    bus_stops.first
  end

  def destination
    bus_stops.last
  end
end

bus_stops = json_data.collect do |bus_stop|
  BusStop.new(bus_stop["start"], bus_stop["destination"], bus_stop["time"])
end

route = Route.new(bus_stops)

route.print
#=> ['A', 'B', 'C']
