require 'spec_helper'

feature 'can create new assignment' do


  before do
    FactoryGirl.create(:course, :name => "Ruby on Rails 101")
    visit '/'
    click_link "Ruby on Rails 101"
    click_link "+ Add Assignment"
  end

  scenario "can create a new assignment" do
    fill_in 'assignment_name', :with => 'Ruby on Rails Quiz'
    fill_in 'assignment_grade', :with => 'A'
    click_button 'Create Assignment'
    page.should have_content('Assignment has been created.')
  end

  scenario "can not create a blank assignment" do
    click_button 'Create Assignment'
    page.should have_content("Assignment has not been created.")
    page.should have_content("Name can't be blank")
    page.should have_content("Grade can't be blank")
  end
end
