# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :kif, null: false
      t.string :turn, null: false
      t.string :answer, null: false
      t.string :title, null: false
      t.string :last_move, null: false
      t.text :explanation
      t.text :answer_explanation
      t.string :my_turn, null: false

      t.timestamps
    end
  end
end
