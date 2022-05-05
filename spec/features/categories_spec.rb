require "rails_helper"

RSpec.describe "Categories", type: :feature do
  describe "New page tests" do
    before { visit new_category_path }

    it 'view new page' do
      expect(page).to have_content 'New category'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
      expect(page).to have_selector(:link_or_button, "Create Category")
    end

    it 'submit the new form' do
      within 'form' do
        fill_in 'Title', with: 'Example Title'
        fill_in 'Description', with: 'Example Description'
        click_on 'Create Category'
      end
    end
  end

  describe "Edit page tests" do
    let(:category) { Category.create!(title: "blab category5", description: "sam description") }
    before { visit "/categories/#{category.id}/edit" }
    
    it 'view edit page' do
      expect(page).to have_content 'Editing category'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
      expect(page).to have_selector(:link_or_button, "Update Category")
    end

    it 'submit the edit form' do
      within 'form' do
        fill_in 'Title', with: 'bla category edit'
        fill_in 'Description', with: 'sam description edit'
        click_on 'Update Category'
      end
    end
  end

  describe "Show page tests" do
    let(:category) { Category.create!(title: "blab category5", description: "sam description") }
    before { visit "/categories/#{category.id}/edit" }

    it 'view show page' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
    end
  end

  describe "Delete category test"
    let(:category) { Category.create!(title: "blab category5", description: "sam description") }
    

end