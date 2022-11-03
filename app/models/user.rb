class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :articles, dependent: :destroy

  validates :username, :email,  presence: true,
                                uniqueness: { case_sensitive: false }

  validates :username,  length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-\_.]+\@[a-z\d\-\_.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX}

  has_secure_password
end
