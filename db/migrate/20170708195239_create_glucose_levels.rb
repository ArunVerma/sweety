class CreateGlucoseLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :glucose_levels do |t|
    	t.integer :reading, null: false
    	t.belongs_to :user, index: true
      t.timestamps
    end
  end
end