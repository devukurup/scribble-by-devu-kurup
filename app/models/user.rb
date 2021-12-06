# frozen_string_literal: true

class User < ApplicationRecord
  MAX_LENGTH = 50
  VALID_EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  has_many :categories

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :first_name, presence: true, length: { maximum: MAX_LENGTH }
  validates :last_name, presence: true, length: { maximum: MAX_LENGTH }

  before_validation :email_to_lowercase

  private

    def email_to_lowercase
      email.downcase!
    end
end
