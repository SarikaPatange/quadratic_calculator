require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/quadratic_calculator") do
  erb(:quadratic_formula_calculator)
end
post("/quadratic_calculator") do
  @a = params.fetch("a_value").to_f
  @b = params.fetch("b_value").to_f
  @c = params.fetch("c_value").to_f
  @d = @b**2 - 4*@a*@c   #discriminant
  @denominator  = 2 * @a
  
  @x = (-@b + @d**0.5) / (2*@a) || @x = (-@b - @d**0.5) / (2*@a)
  @result = @x
  if @d > 0
    @root1 = (-@b + (@d ** 0.5)) / @denominator
    @root2 = (-@b - (@d ** 0.5)) / @denominator
    
  elsif @d == 0
    @root = -@b / @denominator
    
  else
    @root = []
  end
    erb(:quadratic_formula_calculator)
end

  
