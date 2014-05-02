require 'spec_helper'
require 'faker'
require 'capybara/rspec'

feature "Comments are cool, let's make some. But test first..." do

  name1 = Faker::Name.name
  name2 = Faker::Name.name
  title1 = Faker::Lorem.sentence(3)
  title2 = Faker::Lorem.sentence(3)
  title3 = Faker::Lorem.sentence(3)
  goal_text1 = Faker::Lorem.paragraph(4)
  goal_text2 = Faker::Lorem.paragraph(4)
  goal_text3 = Faker::Lorem.paragraph(4)

  body_text1 = Faker::Lorem.paragraph(2)
  body_text2 = Faker::Lorem.paragraph(2)
  body_text3 = Faker::Lorem.paragraph(2)

  before :each do
    create_new_user(name1)
    make_goal(title1, goal_text1)
    make_goal(title2, goal_text2)
    make_goal(title3, goal_text3)
    click_on "Sign Out"
  end

  feature "the comment creation process" do
    before :each do
      create_new_user(name2)
    end

    feature "User creates a comment on a goal" do
      scenario "Has an add comment box on goal page" do
        visit goal_url(1)
        expect(page).to have_content "Add a Comment"
      end

      scenario "Has an add comment box on user page" do
        visit user_url(1)
        expect(page).to have_content "Add a Comment"
      end

      scenario "User creates a comment on the goal page" do
        visit goal_url(1)
        make_comment(body_text1)
        expect(page).to have_content body_text1
      end

      scenario "User creates a comment on another user's page" do
        visit user_url(1)
        make_comment(body_text2)
        expect(page).to have_content body_text2
      end
    end
  end
end