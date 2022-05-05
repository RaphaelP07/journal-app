require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories/new" do
    it "returns the new page" do
      get "/categories/new"

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    it "creates a new category" do

      expect { post "/categories", params: {category: {title: "New Category", description: "Fresh na fresh"}} }.to \
      change(Category, :count)
      .by(1)

      expect(response).to have_http_status(302)
    end
  end

  describe "GET /categories/1/edit" do
    it "returns the edit page" do
      category = Category.create!(title: "New Category", description: "Fresh na fresh")
      get "/categories/#{category.id}/edit"

      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /categories/1" do
    it "updates the category" do
      category = Category.create!(title: "New Category", description: "Fresh na fresh")

      patch "/categories/#{category.id}", params: {category: {title: "Edited Category", description: "edited na Fresh na fresh"}}

      edited_category = Category.find(category.id)
      expect(edited_category.title).to eq "Edited Category"
      expect(edited_category.description).to eq "edited na Fresh na fresh"
    end
  end

  describe "GET /categories/1" do
    it "returns the category details page" do
      category = Category.create!(title: "New Category", description: "Fresh na fresh")
      get "/categories/#{category.id}"

      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /categories/1" do
    it "deletes the category" do
      category = Category.create!(title: "New Category", description: "Fresh na fresh")
      
      expect { delete "/categories/#{category.id}" }.to \
      change(Category, :count)
      .by(-1)

      expect(response).to have_http_status(302)
    end
  end
end
