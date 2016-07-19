require("spec_helper")

describe("Question") do
  describe('#survey') do
    it("tells the survey to which a question belongs") do
      test_survey = Survey.create({:name => "Satisfaction for Epicodus"})
      test_question1 = Question.create({:description => "How much do you like your classes?", :survey_id => test_survey.id()})
      test_question2 = Question.create({:description => "How hard is it?", :survey_id => test_survey.id()})
    expect(test_question1.survey()).to(eq(test_survey))
    end
  end
end
