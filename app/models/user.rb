class User < ApplicationRecord
  validates :username, :email,  presence: true,
                                uniqueness: { case_sensitive: false }

  validates :username,  length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-\_.]+\@[a-z\d\-\_.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX}
end
