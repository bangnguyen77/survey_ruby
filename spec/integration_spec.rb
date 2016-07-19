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
    visit('/surveys/:id')
    fill_in('description', :with => "how are you?")
    click_on('Add question')
    expect(page).to have_content("How are you?")
  end
end
