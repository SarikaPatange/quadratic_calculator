require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:quadratic_formula_calculator)
end

post("/quadratic_calculator") do
  @a = params.fetch("a_value").to_f
  @b = params.fetch("b_value").to_f
  @c = params.fetch("c_value").to_f
  @d = @b**2 - 4*@a*@c   #discriminant
  @denominator  = 2 * @a
  
  if @d >= 0
    
    @root1 = (-@b + @d**0.5) / (2*@a).round(10)
    @root2 = (-@b - @d**0.5) / (2*@a).round(10)
    
  else
    real_part = -@b / (2*@a)
    imaginary_part = Math.sqrt(-@d) / (2*@a)
    @root1 = "#{real_part} + #{imaginary_part}i"
    @root2 = "#{real_part} - #{imaginary_part}i"
  end

  erb(:quadratic_formula_calculator)
end
