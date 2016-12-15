require_relative('../models/hogwarts')
require_relative('../models/houses')

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => house1.name,
  "age" => 19
})

student2 = Student.new({
  "first_name" => "Fergie",
  "last_name" => "Ferg",
  "house" => house2.name,
  "age" => 20
})

student1.save
student2.save


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