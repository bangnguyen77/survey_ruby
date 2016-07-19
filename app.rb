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

get("/surveys/:id") do
  @questions = Question.all()
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("id").to_i())
  erb(:survey)
end


post("/questions/:id/add") do
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("id").to_i())
  description = params.fetch("description")
  survey_id = params.fetch("survey_id").to_i()
  @question = Question.create({:description => description, :survey_id => survey_id})
  @questions = Question.all()
  erb(:survey)
end
