class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true,
                        length: {minimum: 3, maxmimum: 25},
                        uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :email, presence: true,
                        length: {minimum: 5, maxmimum: 105},
                        uniqueness: {case_sensitive: false},
                        format: { with: VALID_EMAIL_REGEX }
end

