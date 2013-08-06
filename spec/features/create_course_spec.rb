require 'spec_helper'

feature 'can create new course' do
  before do
    visit '/'
    click_link '+ New Course'
  end

  scenario "can create a new course" do
    fill_in 'course_title', :with => 'Ruby on Rails 101'
    click_button 'Create Course'
    page.should have_content('Course has been created.')
  end

  scenario "can not create a blank course" do
    click_button 'Create Course'
    page.should have_content("Course has not been created.")
    page.should have_content("Title can't be blank")
  end
end
