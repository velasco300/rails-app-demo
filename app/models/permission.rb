class Permission < ApplicationRecord
  has_many :role_permission_rsps
  has_many :roles, through: :role_permission_rsps
end
