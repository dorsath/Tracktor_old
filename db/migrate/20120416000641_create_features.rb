class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :project_id
      t.integer :state_id, :default => 0
      t.text :body, :default => ""

      t.timestamps
    end
  end
end
