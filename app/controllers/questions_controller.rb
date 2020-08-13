class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy)
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "問題を作成しました"
    else
      render :new
    end
  end

  def index

  end

  def show

  end

  private
    def question_params
      params.require(:question).permit(:kif, :turn, :answer, :title, :last_move, :explanation, :answer_explanation, :my_turn)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
