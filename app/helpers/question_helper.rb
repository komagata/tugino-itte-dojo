module QuestionHelper
  def my_turn(question)
    if question.my_turn == "先"
      "△"
    else
      "▲"
    end
  end
end
