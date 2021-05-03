class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :url
      t.string :company_name
      t.string :company_description


      t.timestamps
    end
  end
end
