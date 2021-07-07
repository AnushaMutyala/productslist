class AddRolemToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rolem, :integer
  end
end
