class CreateClusters < ActiveRecord::Migration[5.2]
  def change
    create_table :clusters do |t|
      t.references :variable, foreign_key: true

      t.timestamps
    end
  end
end
