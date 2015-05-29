require 'rails_helper'

describe "User pages"  do
  
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1)  { FactoryGirl.create(:item, user: user, name: "Foo") }
    let!(:m2)  { FactoryGirl.create(:item, user: user, name: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "item" do
      it { should have_content(m1.name) }
      it { should have_content(m2.name) }
      it { should have_content(user.items.count)}
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information with account activation" do
      before do
        fill_in "Name",                  with: "example user"
        fill_in "Email",                 with: "user@exmaple.com"
        fill_in "Password",              with: "foobar"
        fill_in "Password Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it "should send an activation email" do
        expect(ActionMailer::Base.deliveries.size).to eq(1)
        ActionMailer::Base.deliveries.clear
      end

      # describe "after saving the user" do
      #   before { click_button submit }
      #   let(:user) { User.find_by(email: 'user@example.com') }

      #   it { should have_link('Sign out') }
      #   it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      # end
    end

    describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        visit signin_path 
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
        visit edit_user_path(user)
      end

      describe "page" do
        it { should have_content("Update your profile") }
        it { should have_title("Edit user") }
      end

      describe "with invalid information" do
        before do
          fill_in "Name", with: " " 
          click_button "Save changes"
        end

        it { should have_content("error") }
      end

      describe "with valid information" do
        let(:new_name)  { "New Name" }
        let(:new_email) { "new@example.com" }
        before do
          fill_in "Name",                  with: new_name
          fill_in "Email",                 with: new_email
          fill_in "Password",              with: user.password
          fill_in "Password Confirmation", with: user.password
          click_button "Save changes"
        end

        it { should have_title(new_name) }
        it { should have_selector('div.alert.alert-success') }
        it { should have_link('Sign out', href: signout_path) }
        specify { expect(user.reload.name).to eq new_name }
        specify { expect(user.reload.email).to eq new_email}
      end
    end
  end
end