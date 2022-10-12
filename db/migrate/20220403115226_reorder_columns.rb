class ReorderColumns < ActiveRecord::Migration[5.0]
  def up 
    change_table :users do |t|
      t.change :first_name, :string, after: :email 
      t.change :last_name, :string, after: :first_name
      t.change :admin, :boolean, after: :last_name
    end
  end
end
