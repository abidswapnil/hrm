class Staff < ApplicationRecord
  validates :password, confirmation: true
  validates :name, :gender, :password_confirmation, :birthday, :hometown, :blood_group, :designation, :role, presence: true
  validates :email, uniqueness: true
  has_many :designations

  has_secure_password

  enum gender: {
    male: 0, female: 1
  }
  enum role: {
    'Admin': 0, 'Super admin': 1
  }
  enum blood_group: {
    'A+':0, 'B+':1
  }
  # enum designation: {
  #   'admin': 0, 'super admin': 1
  # }

  enum designation: Designation.all.each_with_index.map { |d, index| [d.name, index] }.to_h if Designation.any?
end
