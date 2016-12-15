require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/hogwarts.rb')
require_relative('./models/houses.rb')

# get all students

get '/houses' do
  @houses = House.all()
  erb(:show_house)
end


get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb(:create)
end

get '/students/:id' do
  id =params[:id]
  @student = Student.find(id)
  erb(:show)
end

post '/students/:id/delete' do
  Student.destroy(params[:id])
  redirect to('/students')
end

# # delete a pizza
# post '/pizzas/:id/delete' do
#   Pizza.destroy( params[:id] )
#   redirect to('/pizzas')
# end

# actually make a pizza
# post '/pizzas' do
#   @pizza = Pizza.new( params )
#   @pizza.save()
#   erb(:create)
# end

# # new pizza form

# get '/pizzas/new' do
#   erb(:new)
# end

# # get/find pizza by id

# get '/pizzas/:id' do

#   id = params[:id]
#   @pizza = Pizza.find(id)
#   erb(:show)
# end


# #  get edit pizza form
# get '/pizzas/:id/edit' do
#   @pizza = Pizza.find(params[:id])
#   erb(:edit)
# end


# # update a pizza
# post '/pizzas/:id' do
#   Pizza.update(params)
#   redirect to "/pizzas/#{ params[:id] }"
# end


# # delete a pizza
# post '/pizzas/:id/delete' do
#   Pizza.destroy( params[:id] )
#   redirect to('/pizzas')
# end