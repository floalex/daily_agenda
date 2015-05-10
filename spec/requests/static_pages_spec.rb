require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
    
  describe "Home page" do

    it "should have the content 'Daily Agenda" do
      visit '/static_pages/home'
      expect(page).to have_content('Daily Agenda')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Daily Agenda")
    end

    it "should no have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
end
