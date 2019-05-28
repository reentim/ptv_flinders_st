class Clock
  def self.now
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
