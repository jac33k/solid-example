class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def calculate_travel_duration
    start_time = Time.parse(bus_stops.first["time"][0])
    stop_time = Time.parse(bus_stops.last["time"][0])
    stop_time - start_time
  end
end

################################################

class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def calculate_travel_duration
    start_time = Time.parse(bus_stops.first["time"]["arrival"])
    stop_time = Time.parse(bus_stops.last["time"]["arrival"])
    stop_time - start_time
  end
end

################################################

class Route
  attr_reader :bus_stops

  def initialize(bus_stops)
    @bus_stops = bus_stops
  end

  def calculate_travel_duration
    stop_time - start_time
  end

  private
  def start_time
    Time.parse(bus_stops.first["time"]["arrival"])
  end

  def stop_time
    Time.parse(bus_stops.last["time"]["arrival"])
  end
end
