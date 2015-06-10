class RemoveLessonIdFromWord < ActiveRecord::Migration
  def change
    remove_column :words, :lesson_id, :integer
  end
end
