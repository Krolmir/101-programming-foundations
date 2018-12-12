# See if "Spot" is present.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?('Spot')
p ages.fetch('Spot', 'does not exist')
p ages.include?('Spot')