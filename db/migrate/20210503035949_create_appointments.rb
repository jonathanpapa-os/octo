class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :gender
      t.string :phone
      t.string :birthday
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
