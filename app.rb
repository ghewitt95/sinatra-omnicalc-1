require "sinatra"
require "sinatra/reloader"
 
get("/") do

  erb(:homepage)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = Math.sqrt(@the_num).to_f

  erb(:root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get ("/payment/results") do
  @num_apr = params.fetch("user_apr").to_f
  @num_years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f

  @monthly_rate = (@num_apr / 100) / 12

  @num_months = @num_years * 12

  if @monthly_rate > 0
    @numerator = @monthly_rate * @principal
    @denominator = 1 - (1 + @monthly_rate) ** -@num_months
    @the_result = @numerator / @denominator
  else
    @the_result = @principal / @num_months
  end

  @num_apr = @num_apr.to_fs(:percentage, precision: 4)
  @principal = @principal.to_fs(:currency)
  @the_result = @the_result.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @min_num = params.fetch("user_min").to_f

  @max_num = params.fetch("user_max").to_f

  @rand_num = rand(@min_num..@max_num)

  erb(:random_results)
end
