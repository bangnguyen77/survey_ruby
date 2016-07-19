require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('adding a new survey', {:type => :feature}) do
  it('allows a user to add a survey') do
    visit('/')
    fill_in('name', :with => "Epicodus SatisFaction")
    click_on('Add Survey')
    expect(page).to have_content('Epicodus satisfaction')
  end
  it("allows a user to view the survey's questions") do
    visit('/')
    fill_in('name', :with => "Epicodus SatisFaction")
    click_on('Add Survey')
    click_link("View Survey's Questions")
    expect(page).to have_content("Epicodus satisfaction")
  end

  it("adds a new question") do
    visit('/')
    fill_in('name', :with => "Epicodus SatisFaction")
    click_on('Add Survey')
    click_link("View Survey's Questions")
    fill_in('Question Name', :with => "how are you?")
    click_on('Add Question')
    expect(page).to have_content("How are you?")
  end

  it("deletes a questions")do
    visit('/')
    fill_in('name', :with => "Epicodus SatisFaction")
    click_on('Add Survey')
    click_link("View Survey's Questions")
    click_on('Delete survey')
    expect(page).to have_content("Welcome to Survey Creater")
  end
end
