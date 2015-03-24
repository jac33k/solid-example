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

  def change_departure_time(new_time)
    time["departure"] = new_time
  end
end

class ReadOnly
  def_delegators :@bus_stop, :arrival_time, :departure_time

  def initialize(bus_stop)
    @bus_stop = bus_stop
  end
end

bus_stop = BusStop.new("X", "Y", Time.now)

bus_stop_ro = ReadOnly.new(bus_stop)

bus_stop.change_departure_time("10:02") # works fine

bus_stop_ro.change_departure_time("10:02") # NoMethodError
