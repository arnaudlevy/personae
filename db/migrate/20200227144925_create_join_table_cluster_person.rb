class CreateJoinTableClusterPerson < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clusters, :people do |t|
      t.references :cluster, foreign_key: true
      t.references :person, foreign_key: true
    end
  end
end
