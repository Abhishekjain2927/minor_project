class Doctor < ApplicationRecord
 has_many :appoinments, dependent: :destroy
geocoded_by :address        # can also be an IP address
after_validation :geocode          # auto-fetch coordinates
end
