class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :slug
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
