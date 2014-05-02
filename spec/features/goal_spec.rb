require 'spec_helper'
require 'faker'
require 'capybara/rspec'


feature "Goals are cool, let's make some. But test first..." do

  title1 = Faker::Lorem.sentence(3)
  title2 = Faker::Lorem.sentence(3)
  title3 = Faker::Lorem.sentence(3)
  goal_text1 = Faker::Lorem.paragraph(4)
  goal_text2 = Faker::Lorem.paragraph(4)
  goal_text3 = Faker::Lorem.paragraph(4)
  name1 = Faker::Name.name
  name2 = Faker::Name.name

  feature "the goal creation process" do

    before :each do
      create_new_user
    end

    # create_new_user
    title1 = Faker::Lorem.sentence(3)
    goal_text1 = Faker::Lorem.paragraph(4)
    goal_text2 = Faker::Lorem.paragraph(4)


    feature "User creates a new goal" do
      before :each do
        make_goal(title1, goal_text1)
      end
      scenario "redirects to goal show page after creation" do
        expect(page).to have_content "New Goal"
      end

      scenario "User can read their goal after creation" do
        expect(page).to have_content goal_text1
      end
    end

    feature "User can update their goal" do
      before :each do
        make_goal(title1, goal_text1)
        #visit goal_url(id: 1)
        click_on "Edit Goal"
        end

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
      before :each do
        make_goal(title1, goal_text1)
        click_on "Delete Goal"
      end

      scenario "User's goal is gone" do
        expect(page).to_not have_content goal_text2
      end
    end

  end

  feature "Private vs public goals" do

    before :each do
      create_new_user(name1) #=> goal#index
      make_goal(title1, goal_text1, true)
      make_goal(title2, goal_text2, false)
      click_on "Sign Out"
      create_new_user(name2)
      make_goal(title3, goal_text3, false)
    end

    scenario "User can see all their goals" do
      expect(page).to have_content goal_text3
      visit goals_url
      expect(page).to have_content title2
    end

    scenario "User's goals are private if marked private" do
      visit goals_url
      expect(page).to_not have_content title1
    end

    scenario "User can see others' public goals" do
      visit goals_url
      expect(page).to have_content title2
      expect(page).to have_content title3
    end
  end

  feature "Goal Completion" do

    before :each do
      create_new_user(name1)
      make_goal(title1, goal_text1)
      make_goal(title2, goal_text2)
      make_goal(title3, goal_text3)
      visit goals_url
    end

    scenario "A user can mark a goal as completed" do
      click_on "#{title1}"
      click_on "Edit Goal"
      choose "completion_true"
      click_on "Edit Goal"
      expect(page).to have_content "Completed? true"
    end

    scenario "A users's goal starts as uncompleted" do
      click_on "#{title2}"
      expect(page).to have_content "Completed? false"
    end
  end

end