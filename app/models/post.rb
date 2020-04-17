class Post < ApplicationRecord
  #アソシエーション(1:多)
  belongs_to :user
  
  with_options presence: true do
    validates :gole
    validates :who
    validates :where
  end
end
