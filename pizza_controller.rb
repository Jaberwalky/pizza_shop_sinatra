require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/pizza.rb')

# READ - 


# URL - HTTP Verb - Action - CRUD Action
# /photos - GET - index - READ
# /photos/new - GET - new - CREATE
# /photos - POST - create - CREATE
# /photos/:id = GET - show - READ
# /photos/:id/edit - GET - edit - UPDATE
# /photos/:id = PATCH/PUT - update - UPDATE
# /photos/:id = DELETE - destroy - DELETE

# INDEX - READ
get '/pizzas' do
  @pizzas = Pizza.all()
  erb( :index )
end

# ---------------------------------------
# NEW - CREATE
get '/pizzas/new' do
  erb(:new)
end

# CREATE - CREATE
post '/pizzas' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end
# --------------------------------------

# EDIT - UPDATE
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb(:edit)
end

# UPDATE - UPDATE
post '/pizzas/:id' do
  @pizza = Pizza.new( params )
  @pizza.update()
  redirect ('/pizzas')
end

# SHOW - READ
get '/pizzas/:id' do
  @pizza = Pizza.find( params[:id] )
  erb( :show )
end

# DELETE - DELETE
post '/pizzas/:id/delete' do
  @pizza = Pizza.find( params[:id])
  @pizza.delete()
  redirect ('/pizzas')
end

# /photos/:id/edit - GET - edit - UPDATE
# /photos/:id = PATCH/PUT - update - UPDATE
# GET /pizzas/:id/edit  edit
# POST  /pizzas/:id update



