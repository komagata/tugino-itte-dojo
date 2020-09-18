# frozen_string_literal: true

require "application_system_test_case"
class QuestionsTest < ApplicationSystemTestCase
  setup do
    login_as users(:user1)
  end

  test "問題を作成" do
    visit new_question_path
    fill_in "question[title]", with: "三間飛車の中盤"
    fill_in "question[kif]", with: "サンプル"
    fill_in "question[turn]", with: "45"
    fill_in "question[last_move]", with: "9六飛"
    fill_in "question[answer]", with: "9九飛"
    fill_in "question[explanation]", with: "難しいです"
    fill_in "question[answer_explanation]", with: "9九飛で評価値プラス"
    click_on "問題を保存する"
    assert_text "問題を作成しました"
  end

  test "問題を閲覧" do
    visit questions_path
    click_on "三間飛車の序盤"
    assert_text "これで評価値プラス"
  end

  test "問題を削除" do
    visit question_path(1)
    page.accept_confirm do
      click_on "削除する"
    end
    assert_text "問題を削除しました"
  end

  test "問題を編集" do
    visit edit_question_path(1)
    fill_in "question[title]", with: "編集後の問題"
    click_on "問題を保存する"
    assert_text "問題を編集しました"
    assert_text "編集後の問題"
  end

  test "問題の答えを見る" do
    visit question_path(1)
    click_on "答えを見る"
    assert_text "7五歩"
  end
end
