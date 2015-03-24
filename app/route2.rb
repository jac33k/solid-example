class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = parse_bus_stops(bus_stops)
  end

  def calculate_travel_duration
    stop_time - start_time # returns an error
  end

  BusStop = Struct.new(:start, :destination, :time)

  private
  def parse_bus_stops(bus_stops)
    bus_stops.collect do |bus_stop|
      BusStop.new(bus_stop["start"], bus_stop["destination"], bus_stop["time"])
    end
  end

  def start_time
    Time.parse(bus_stops.first.time["arrival"])
  end

  def stop_time
    Time.parse(bus_stops.last.time["arrival"])
  end
end

################################################

class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = parse_bus_stops(bus_stops)
  end

  def calculate_travel_duration
    destination.arrival_time - start.arrival_time
  end

  BusStop = Struct.new(:start, :destination, :time) do
    def departure_time
      Time.parse(time["departure"])
    end

    def arrival_time
      Time.parse(time["arrival"])
    end
  end

  private
  def parse_bus_stops(bus_stops)
    bus_stops.collect do |bus_stop|
      BusStop.new(bus_stop["start"], bus_stop["destination"], bus_stop["time"])
    end
  end

  def start
    bus_stops.first
  end

  def destination
    bus_stops.last
  end
end

################################################

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

route.calculate_travel_duration
#=> 30
