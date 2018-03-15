class Post < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :pets

  validates :name, :content, :pet_ids, presence: true
  


  
end
