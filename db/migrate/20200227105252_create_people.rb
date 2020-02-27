class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.references :study, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
