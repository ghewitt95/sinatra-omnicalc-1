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

get("/square_root/result") do
  @the_num = params.fetch("user_number").to_f

  @the_result = Math.sqrt(@the_num).to_i

  erb(:root_results)
end

get("/payment/new") do

  erb(:payment_calc)
end

get("/random/new") do

  erb(:random_calc)
end
