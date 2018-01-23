class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    total_seconds = @seconds
    Time.at(total_seconds).utc.strftime('%H:%M:%S')
  end
end
