# coding: utf-8
class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: { message: "用户名不能为空" }, uniqueness: { message: "用户名已经存在" }
  validates :password, presence: {message: '密码不能为空'}, length: { minimum: 6, message: '密码不能少于6位' }

  has_many :user_role_rsps
  has_many :roles, through: :user_role_rsps
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
