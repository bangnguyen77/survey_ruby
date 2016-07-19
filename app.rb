require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")
require("pry")

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
  @survey = Survey.find(params.fetch("id").to_i())
  # @question = Question.find(params.fetch("id").to_i())
  # @questions = Question.all()

  erb(:survey)
end


patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  @surveys = Survey.all()
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end

post("/questions") do
  description = params.fetch("description")
  survey_id = params.fetch("survey_id").to_i()
  @question = Question.create({:description => description, :survey_id => survey_id})
  # @questions = Question.all()
  # @surveys = Survey.all()
  @survey = Survey.find(survey_id)
  if @question.save()
    erb(:survey)
  else
    erb(:error)
  end
  # redirect("/surveys/" + survey_id.to_s())
end


delete("/questions/:id") do
  question = Question.find(params.fetch("id").to_i())
  survey = question.survey()
  question.delete()
  # @questions = Question.all()
  redirect("/surveys/" + survey.id().to_s())
end
