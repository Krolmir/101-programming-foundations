# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized

# itterrate through the hash 
# if key of key = type 'fruit' 
# - return colores (capitalize)
# elsif key of key = type 'vegtable'
# - return size (uppdercase)

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |key, value|
  if hsh[key][:type] == 'fruit'
    hsh[key][:colors].map { |v| v.capitalize! }
  elsif hsh[key][:type] == 'vegetable'
    hsh[key][:size].upcase!
  end
end

# The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
