require 'spec_helper'
require 'faker'
require 'capybara/rspec'
feature "Yea right" do
  before :each do
    # 1.times do
      visit 'http://192.168.128.181:3000/users/new'
      fill_in "username", with: "Testing123"#Faker::Name.name
      fill_in "password", with: "123456"#Faker::Name.name
      click_on "Create User"
    # end
  end

end
