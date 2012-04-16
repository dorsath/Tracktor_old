class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.integer :feature_id
      t.text :description
      t.text :body
      t.integer :type_id, :default => 0

      t.timestamps
    end
  end
end
