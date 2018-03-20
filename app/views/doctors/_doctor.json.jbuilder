json.extract! doctor, :id, :first_name, :last_name, :email, :mobile_number, :specalist_in, :gender, :city, :state, :address, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
