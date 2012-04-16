class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :project_id
      t.integer :status_id, :default => 0

      t.timestamps
    end
  end
end
