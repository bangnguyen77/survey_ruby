require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")

get("/") do
  @surveys = Survey.all()
  erb(:index)
end

post("/surveys") do
  @surveys = Survey.all()
  name = params.fetch("name")
  survey = Survey.create({:name => name})
  erb(:index)
end
