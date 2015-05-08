require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
    
  describe "Home page" do

    it "should have the content 'Daily Agenda" do
      visit '/static_pages/home'
      expect(page).to have_content('Daily Agenda')
    end
  end
end
