class AddLinkToAstro < ActiveRecord::Migration[5.0]
  def change
    add_column :astros, :link, :string
  end
end
