class CreateAstros < ActiveRecord::Migration[5.0]
  def change
    create_table :astros do |t|
      t.string "date"
      t.string "description"
      t.timestamps
    end
  end
end
