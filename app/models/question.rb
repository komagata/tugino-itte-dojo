# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user

  acts_as_taggable

  def previous
    user.questions.order("created_at desc, id desc").where("created_at <= ? and id < ?", created_at, id).first
  end

  def next
    user.questions.order("created_at desc, id desc").where("created_at >= ? and id > ?", created_at, id).reverse.first
  end
end
