require 'rails_helper'

RSpec.describe Item, type: :model do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    @item = user.items.build(name: "Lorem ipsum")
  end

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @item.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @item.name = "a" * 101 }
    it { should_not be_valid }
  end

end
