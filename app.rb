require "sinatra"
require "sinatra/reloader"
 
get("/") do

  erb(:homepage)
end

get("/square/new") do


  erb(:new_square_calc)
end

get("/square_root/new") do

  erb(:new_root_calc)
end

get("/payment/new") do

  erb(:payment_calc)
end

get("/random/new") do

  erb(:random_calc)
end
