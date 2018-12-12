# Turn this into an array containing only two elements!

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc('Barney')

# p flintstones = flintstones.flatten
# flintstones.delete_if { |v| v != 'Barney' && v != 2 }
# p flintstones
