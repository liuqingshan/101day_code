require "rails_helper"

RSpec.feature "Creating Production" do
  scenario "create production" do
    visit "/productions"

    click_link "New Production"

    fill_in "Name", with: "Name1"
    check "category_id_1"
    check "category_id_2"
    click_button "Create Production"

    expect(page).to have_content "Production was successfully created."
    expect(page).to have_content "A"
    expect(page).to have_content "B"
  end
end


