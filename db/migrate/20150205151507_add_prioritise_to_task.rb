class AddPrioritiseToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :prioritise, :integer, default: 1
  end
end
