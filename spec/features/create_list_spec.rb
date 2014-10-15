require 'rails_helper'

feature 'Successfully create a single to-do list' do 
  scenario 'Successfully' do
    visit new_list_path
  end
end