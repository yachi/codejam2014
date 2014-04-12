#!/usr/bin/env ruby

f = File.open ARGV[0]

lines = f.readlines
n = lines.shift.to_i

n.times do |i|
  line = lines.shift
  # puts line
  r, c, m = line.split(' ').collect(&:to_i)
  j = 0 #row
  k = 0 #col

  grid = []

  # puts "r,c,m: #{r}, #{c}, #{m}"
  (r*c-m).times do |l|
    # puts "j,k: #{j}, #{k}"
    unless grid[j]
      grid << []
    end
    if grid[j].length == c
      j += 1
    end
    unless grid[j]
      grid << []
    end
    grid[j] << "."
  end

  impossible = false
  if r > 1 and c > 1
    impossible = true unless grid[1] and grid[1][1]
  end
  puts "Case ##{i+1}:"
  if impossible
    puts "Impossible"
  end
  # puts grid.inspect
  # break if i > 1

  unless impossible
    r.times do |x|
      c.times do |y|
        if x == 0 and y == 0
          print 'c'
        else
          if grid[x] and grid[x][y]
            print '.'
          else
            print '*'
          end
        end
      end
      puts "\n"
    end
  end
end
