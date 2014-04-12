#!/usr/bin/env ruby

f = File.open ARGV[0]

lines = f.readlines
n = lines.shift.to_i

n.times do |i|
  a1 = lines.shift.to_i
  rows1 = []
  rows1 << lines.shift.split(' ').collect(&:to_i)
  rows1 << lines.shift.split(' ').collect(&:to_i)
  rows1 << lines.shift.split(' ').collect(&:to_i)
  rows1 << lines.shift.split(' ').collect(&:to_i)
  row1 = rows1[a1 - 1]

  a2 = lines.shift.to_i
  rows2 = []
  rows2 << lines.shift.split(' ').collect(&:to_i)
  rows2 << lines.shift.split(' ').collect(&:to_i)
  rows2 << lines.shift.split(' ').collect(&:to_i)
  rows2 << lines.shift.split(' ').collect(&:to_i)
  row2 = rows2[a2 - 1]

  answer = (row1 & row2)
  print "Case ##{i+1}: "
  if answer.length == 1
    puts answer[0]
  elsif answer.length > 1
    puts "Bad magician!"
  else
    puts "Volunteer cheated! "
  end
end
