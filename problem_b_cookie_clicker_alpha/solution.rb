#!/usr/bin/env ruby

f = File.open ARGV[0]

lines = f.readlines
n = lines.shift.to_i

n.times do |i|
  line = lines.shift
  c,f,x = line.split(' ').collect{|x| x.to_f}

  stop_now_times = []
  time = 0.0
  speed = 2.0

  stop = false

  while stop == false
    stop_now_times << (time + x / speed)
    if stop_now_times.length > 1
      if stop_now_times[stop_now_times.length - 2] < stop_now_times[stop_now_times.length - 1]
        stop = true
      end
    end
    t = c / speed
    time += t
    speed += f
  end

  # puts "#{c} #{f} #{x}"
  # puts stop_now_times.min
  print "Case ##{i+1}: "
  puts "%.7f" % stop_now_times[stop_now_times.length - 2]
end
