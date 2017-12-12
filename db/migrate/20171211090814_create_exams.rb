class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string "exam_name", :limit => 50
      t.integer "question_paper_id"
      t.timestamps
    end
  end
end
