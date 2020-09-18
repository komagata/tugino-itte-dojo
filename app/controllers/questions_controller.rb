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

  def update
    if @question.update(question_params)
      redirect_to questions_url, notice: "問題を編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @question.destroy
      redirect_to questions_url, notice: "問題を削除しました"
    else
      render :index
    end
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
