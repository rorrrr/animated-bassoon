require_relative('../models/houses')
require_relative('../models/hogwarts')

require ('pry')

house1 = House.new({
  "name" => "Red",
  "logo" => "red-logo.jpg"
})

house2 = House.new({
  "name" => "Blue",
  "logo" => "blue-logo.jpg"
})

house3 = House.new({
  "name" => "Green",
  "logo" => "green.jpg"
})

house1.save
house2.save
house3.save


student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 19
})

student2 = Student.new({
  "first_name" => "Fergie",
  "last_name" => "Ferg",
  "house_id" => house2.id,
  "age" => 20
})

student1.save
student2.save

# binding.pry
# nil