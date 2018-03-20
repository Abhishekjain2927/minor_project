class CreateAppoinments < ActiveRecord::Migration[5.1]
  def change
    create_table :appoinments do |t|
      t.string :time

      t.timestamps
    end
  end
end
