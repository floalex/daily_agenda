require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
    
  describe "Home page" do
    before { visit root_path }

    it "should have the content 'Daily Agenda" do
      expect(page).to have_content('Daily Agenda')
    end

    it "should have the base title" do
      expect(page).to have_title("Daily Agenda")
    end

    it "should no have a custom page title" do
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "should have the content 'Help' " do
      expect(page).to have_content('Help')
    end

    it "should have the title" do
      expect(page).to have_title('Help')
    end
  end
end
