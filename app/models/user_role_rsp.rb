# coding: utf-8
class UserRoleRsp < ApplicationRecord
  validates :role, presence: { message: '不能为空' }
  validates :user, presence: { message: '不能为空' }
  validates :user, uniqueness: { scope: :role, message: '记录已经存在' }
  
  belongs_to :user
  belongs_to :role
end
