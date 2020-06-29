require 'rails_helper'
require 'airborne'

RSpec.describe CategoriesController, :type => :controller do
    before do
        @category = Category.create(name: "Sports")
    end

    describe "GET INDEX" do
        it "should get 200" do
            get :index
            expect(response.status).to eq(200)
        end
    end
  
    describe "GET NEW" do
        it "should get 200" do
            get :new
            expect(response.status).to eq(200)
        end
    end

    describe "GET SHOW" do
        it "should get 200" do
            get :show, params: { id: @category.id }
            expect(response.status).to eq(200)
        end
    end

    describe "POST CREATE" do 
        it "should create a category" do 
            expect {
                post :create, params: { category: {  name: "Travel" } }
            }.to change(Category, :count).by(1)
        end

        it "should redirect to new category" do
            post :create, params: { category: {  name: "Travel" } } 
            response.should redirect_to Category.last
        end
    end
end