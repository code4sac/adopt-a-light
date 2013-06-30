class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :problem_desc
      t.integer :problem_type_id
      t.integer :thing_id
      t.integer :sent
      t.integer :resolved
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
