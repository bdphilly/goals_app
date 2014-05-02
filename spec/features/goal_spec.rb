require 'spec_helper'
require 'faker'

feature "the goal creation process" do

  create_new_user
  goal_text1 = Faker::Lorem.paragraph(4)
  goal_text2 = Faker::Lorem.paragraph(4)


  feature "User creates a new goal" do
    visit new_goal_url
    fill_in "Goal", :with => goal_text1
    click_on "Submit Goal"

    scenario "redirects to goal show page after creation" do
      expect(page).to have_content "New Goal"
    end

    scenario "User can read their goal after creation" do
      expect(page).to have_content goal_text1
    end
  end

  feature "User can update their goal" do
    visit goal_url(goal_id: 1)
    click_on "Edit Goal"

    scenario "redirects to goal edit page" do
      expect(page).to have_content "Edit Goal"
    end

    scenario "user can edit their goal" do
      fill_in "Goal", :with => goal_text2
      click_on "Edit Goal"
      expect(page).to have_content goal_text2
    end
  end

  feature "User can delete their goal" do
    visit goal_url(goal_id: 1)
    click_on "Delete Goal"

    scenario "User's goal is gone" do
      expect(page).to_not have_content goal_text2
    end
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