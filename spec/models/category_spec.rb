require 'rails_helper'

RSpec.describe Category, type: :model do

  before do
    @category = Category.new(name: "Sports")
  end

  it "category should be valid" do
    expect(@category).to be_valid
  end

  it "name should be present" do
    @category.name = " "
    expect(@category).to_not be_valid
  end

  it "name should be unique" do
    @category.save
    category2 = Category.new(name: "Sports")
    expect(category2).to_not be_valid
  end

  it "name should not be too long" do
    @category.name = "a" * 26
    expect(@category).to_not be_valid
  end

  it "name should not be too short" do
    @category.name = "aa"
    expect(@category).to_not be_valid
  end
end
