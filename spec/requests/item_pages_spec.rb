require 'rails_helper'

RSpec.describe "ItemPages", type: :request do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before do
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  describe "item creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a item" do
        expect { click_button "Post" }.not_to change(Item, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'item_name', with: "Lorem ipsum" }
      it "should create a item" do
        expect { click_button "Post" }.to change(Item, :count).by(1)
      end
    end
  end

  describe "item destruction" do
    before { FactoryGirl.create(:item, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete an item" do
        expect { click_link "delete" }.to change(Item, :count).by(-1)
      end
    end
  end

end

