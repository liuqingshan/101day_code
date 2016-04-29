require "rails_helper"

RSpec.feature "Users can sign up" do
   scenario "when providing valid details" do
     visit "/"
     click_link "Sign up"
     fill_in "Email", with: "test@example.com"
     fill_in "user_password"
   end
end
