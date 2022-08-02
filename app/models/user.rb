class User < ApplicationRecord
  validates :username, presence: true,
                        length: {minimum: 3, maxmimum: 25},
                        uniqueness: {case_sensitive: false}
  validates :email, presence: true,
                        length: {minimum: 5, maxmimum: 105},
                        uniqueness: {case_sensitive: false}
end
