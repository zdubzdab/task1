require 'spec_helper'

describe "registration" do
   it "should simulate user registration" do
     visit root_path
     click_link "Реєстрація"
     page.should have_content "Реєстрація"
     fill_in "user_first_name", with: "Test"
     fill_in "user_last_name", with: "User"
     fill_in "user_email", with: "test@test.com"
     fill_in "user_password", with: "password"
     click_button "Зареєструватись"
     page.should have_content "Password doesn't match confirmation"

     fill_in "user_password", with: "password"
     fill_in "user_password_confirmation", with: "password"
     click_button "Зареєструватись"
     page.should have_content "Користувача успішно зареєстровано"
   end
end