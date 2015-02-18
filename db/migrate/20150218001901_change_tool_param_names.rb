class ChangeToolParamNames < ActiveRecord::Migration
  def change
    remove_column :tools, :type
    add_column :tools, :tool_type, :string
    remove_column :tools, :model
    add_column :tools, :tool_model, :string
  end
end



