require 'spec_helper'
require 'faker'

feature "the goal creation process" do

  before(:each) do
    create_new_user
  end

  feature "User creates a new goal" do
    visit new_goal_url
    goal_text = Faker::Lorem.paragraph(4)
    fill_in "Goal", :with => goal_text
    click_on "Submit Goal"
  end

    scenario "redirects to goal show page after creation" do
      expect(page).to have_content "New Goal"
    end

    scenario "User can read their goal after creation" do
      expect(page).to have_content goal_text
    end

  feature "User can update their goal" do
    visit goal_url(goal_id: 1)
    click_on "Edit Goal"
  end

    scenario "redirects to goal edit page" do
      expect(page).to have_content "Edit Goal"
    end

    scenario "user can edit their goal" do
      goal_text = Faker::Lorem.paragraph(4)
      fill_in "Goal", :with => goal_text
      click_on "Edit Goal"
      expect(page).to have_content goal_text
    end

    scenario "User can delete their goal"

    end
end

feature "Private vs public goals" do

  create_new_user

  def scenario "User can see all their goals"

  end

  def scenario "User's goals are private if marked private"

  end

  def scenario "User can see others' public goals"

  end