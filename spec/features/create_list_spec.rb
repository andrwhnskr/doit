require 'rails_helper'

feature 'Successfully create a single to-do list' do 
  scenario 'Successfully' do
    visit new_list_path
    fill_in('Title', with: 'First List')
    fill_in('Description', with: 'Create lists controller, list.rb, associated views')
    click_button('Save')
    expect( page ).to have_content("List was created!")
    expect( page ).to have_content("First List")
    expect( page ).to have_content("Create lists controller, list.rb, associated views")
  end
end