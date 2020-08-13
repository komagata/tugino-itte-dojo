require "rails_helper"

RSpec.describe "Questions", type: :system do
  it "問題を保存する" do
    visit new_question_path

    fill_in "Title", with: "test"
    fill_in "Kif", with: "test"
    fill_in "Turn", with: "test"
    fill_in "Last move", with: "test"
    fill_in "Answer", with: "test"
    fill_in "Explanation", with: "test"
    fill_in "Answer explanation", with: "test"
    fill_in "My turn", with: "test"

    click_button "問題を保存する"
    expect(page).to have_content 'test'
  end
end
