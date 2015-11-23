class CreateTestmodels < ActiveRecord::Migration
  def change
    create_table :testmodels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
