class User < ApplicationRecord
  devise :database_authenticatable,
    :recoverable, :rememberable, :validatable,
    :lockable, :trackable
end
