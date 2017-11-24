ballots = [
  {1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
   {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
   {1 => 'Bedlla', 2 => 'Boots', 3 => 'Smudge'},
   {1 => 'Boots', 2 => 'Felix', 3 => 'Bella'},
   {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
   {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}
]


# first place recieves 3 points
# second place recieves 2 points
# third place recieves 1 point


points_total = {}

ballots.each do |total|
  # p total #iterates through each instance of hash
  total.each do |rank , name|
    # puts name#iterates over each hash dicerctly
    if points_total[name] == nil
      if rank == 1
        points_total[name] = 3
        # puts points_total
      elsif rank == 2
        points_total[name] = 2
      elsif rank == 3
        points_total[name] = 1
      end
    else
      if rank == 1
        points_total[name] += 3
      elsif rank == 2
        points_total[name] += 2
      elsif rank == 3
        points_total[name] += 1
      end
    end

  end
end

# puts points_total
#
# puts a = points_total.values.max

# puts "winner #{points_total.key(a)}"

 sorted_tally = points_total.sort_by {|rank, value| value}.to_h
#  p sorted_tally.invert
i = 1
tie = {}
sorted_tally.each_with_index do |(key, value), index|
  if !tie.keys.include?(value)
   tie[value] = []
  end
  if !tie[value].include?(key)
  tie[value] << key
end
  if value == sorted_tally.values[index + 1]
    tie[value] << sorted_tally.keys[index + 1]
  end
end
puts tie
