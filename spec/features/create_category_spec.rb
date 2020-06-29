require 'rails_helper'
require 'capybara/rails'

RSpec.feature "CreateCategories", type: :feature do
  scenario "get new category form and creating a category" do
      visit "/categories/new"
      expect(current_path).to eql(new_category_path)

      expect {
        fill_in "Category name",	with: "Sports" 
        click_button "Create Category" 
       }.to change(Category, :count).by(1)

       expect(current_path).to eql(category_path(Category.last))

       expect(page).to have_content("Sports")
  end

  scenario "get new category form and reject invalid category submission" do
    visit "/categories/new"
    expect(current_path).to eql(new_category_path)

    expect {
      fill_in "Category name",	with: " " 
      click_button "Create Category" 
     }.to_not change(Category, :count)

     expect(page).to have_content("errors")
     expect(page).to have_css 'div.alert'
     expect(page).to have_css 'h4.alert-heading'
  end
end
