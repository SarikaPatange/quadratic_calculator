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
get("/quadratic_results") do
  @a = params.fetch("coefficient_a")
  @b = params.fetch("coefficient_b")
  @c = params.fetch("coefficient_c")
  
  @answer = @a*x**2 + @b*x + @c
  
 
  erb(:quadratic_formula_results)
end
