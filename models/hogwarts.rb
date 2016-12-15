require_relative('../db/sql_runner')

class Student

  attr_reader( :first_name, :last_name, :house_id, :age, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (
      first_name,last_name,house_id,age ) VALUES 
      ('#{ @first_name }','#{ @last_name }','#{@house_id}','#{ @age }') 
      RETURNING *"
    student_info = SqlRunner.run(sql)
    @id = student_info.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id=#{id}"
    student = SqlRunner.run( sql )
    result = Student.new( student.first )

    return result
  end

  def self.update( options )
    sql = "UPDATE students SET
          first_name='#{options['first_name']}',
          last_name='#{options['last_name']}',
          house_id='#{options['house_id']}',
          age='#{options['age']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM students WHERE id=#{id}"
    SqlRunner.run( sql )
  end

  # Add a method to Student to find a house() for the student

  def house()
    sql = "SELECT houses.* from houses
    WHERE id = #{@house_id}"
    result = SqlRunner.run( sql ).first
    return result["name"]
  end

  # def count_tickets
  #     sql = "
  #     SELECT tickets.* FROM tickets
  #     WHERE customer_id = #{@id}
  #     "
  #     return SqlRunner.run( sql ).count
  # end


end