class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :variable, foreign_key: true
      t.references :person, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
