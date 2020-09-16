# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy)
  before_action :check_permission, only: %i(show edit update destroy)
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question, notice: "問題を作成しました"
    else
      render :new
    end
  end

  def index
    @questions = Question.where(user_id: current_user.id).page(params[:page]).per(10)
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

    def check_permission
      if @question.user_id != current_user.id
        flash[:notice] = "権限がありません"
        redirect_to questions_url, notice: "権限がありません"
      end
    end
end
