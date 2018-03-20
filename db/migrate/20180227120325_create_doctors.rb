class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.string :specalist_in
      t.string :gender
      t.string :city
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
