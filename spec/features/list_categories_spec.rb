require 'rails_helper'
require 'capybara/rails'

RSpec.feature "ListCategories", type: :feature do
    before do
        @category = Category.create(name: "Sports")
        @category2 = Category.create(name: "Travel")
    end

    it "should show categories listing" do
        visit "/categories"
        expect(page).to have_link(@category.name, href: category_path(@category))
        expect(page).to have_link(@category2.name, href: category_path(@category2))
    end
end