
class Visit < ApplicationRecord

  belongs_to :users, 
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id 

  
end