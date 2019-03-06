class Role < ApplicationRecord
  has_many :role_permission_rsps
  has_many :permissions, through: :role_permission_rsps
  has_many :user_role_rsps
  has_many :users, through: :user_role_rsps
end
