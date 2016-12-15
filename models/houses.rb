require_relative('../db/sql_runner')

class House

  attr_reader( :name, :logo, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (name,logo ) 
    VALUES ('#{ @name }','#{ @logo }') 
      RETURNING *"
    house_info = SqlRunner.run(sql)
    @id = house_info.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id}"
    house = SqlRunner.run( sql )
    result = House.new( house.first )
    return result
  end

#   def self.update( options )
#     sql = "UPDATE students SET
#           first_name='#{options['first_name']}',
#           last_name='#{options['last_name']}',
#           house='#{options['house']}',
#           age='#{options['age']}'
#           WHERE id='#{options['id']}'"
#     SqlRunner.run( sql )
#   end

#   def self.destroy( id )
#     sql = "DELETE FROM students WHERE id=#{id}"
#     SqlRunner.run( sql )
#   end

end