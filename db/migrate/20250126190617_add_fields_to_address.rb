class AddFieldsToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :complement, :string
    add_column :addresses, :number, :integer
  end
end
