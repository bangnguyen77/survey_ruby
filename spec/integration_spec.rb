require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('adding a new survey', {:type => :feature}) do
  it('allows a user to add a survey') do
    visit('/')
    click_on('Create new Survey')
    fill_in('name', :with => "Epicodus Satisfaction")
    click_button('Add Survey')
    expect(page).to have_content('Epicodus Satisfaction')
  end

end
