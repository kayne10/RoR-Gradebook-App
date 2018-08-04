class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :new, :string
  end
end
