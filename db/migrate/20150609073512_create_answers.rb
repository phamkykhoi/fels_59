class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :word_id
      t.boolean :correct
      t.string :content

      t.timestamps null: false
    end
  end
end
