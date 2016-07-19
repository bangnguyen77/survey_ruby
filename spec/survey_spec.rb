require("spec_helper")

describe(Survey) do
  describe("#questions") do
    it("tells which questions are in the survey") do
      test_survey = Survey.create({:name => "Satisfaction"})
      test_question1 = Question.create({:description => "How do you feel with Ruby?", :survey_id => test_survey.id()})
      test_question2 = Question.create({:description => "How do you feel with JavaScript?", :survey_id => test_survey.id()})
      expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
  it("capitalizes the title") do
    test_survey = Survey.create({:name => "epicodus satisfaction"})
    expect(test_survey.name()).to(eq("Epicodus satisfaction"))
  end
end
