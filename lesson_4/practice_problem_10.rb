# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior). Your solution should produce the
# hash below

# explicit rules
# a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a
# senior is aged 65+.

# itterate through the munsters hash
# itterate through the nested hash per munster
# - add age group as a key -------
# - get the current munsters age
# - if age is 0-17 assign age group key a value of kid
# - elsif age is 18-64 assign age group key to a value of adult
# - elsif age >= 65 assign age group key to a value of senior

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

munsters.each do |m_key, m_value|
  temp = { m_key => { 'age group' => '' } }
  munsters[m_key]['age group'] = temp[m_key]['age group']
  if m_value.is_a?(Hash)
    m_value.each do |n_key, n_value|
      if n_key == 'age'
        case
        when n_value >= 0 && n_value <= 17
          munsters[m_key]['age group'] = 'kid'
        when n_value >= 18 && n_value <= 64
          munsters[m_key]['age group'] = 'adult'
        when n_value >= 65
          munsters[m_key]['age group'] = 'senior'
        end
      end
    end
  end
end

p munsters

# This is the way launch did it..... oh boy did I overthink this one _

# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end
