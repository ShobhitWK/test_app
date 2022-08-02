class User < ApplicationRecord
  validates :username, presence: true, length: {minimum: 3, maxmimum: 25}, uniqueness: true
  validates :email, presence: true, length: {maxmimum: 105}, uniqueness: true
end
