class Post < ApplicationRecord
  belongs_to :user
  has_and_belong_to_many :pets
end
