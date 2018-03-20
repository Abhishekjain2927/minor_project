class AddDoctorToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :doctor, :boolean
  end
end
