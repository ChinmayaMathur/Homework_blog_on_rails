class Comment < ApplicationRecord
      #-----------------------------Associations--------------------------------------------------->
      belongs_to :post

       #-----------------------------Validations---------------------------------------------------->
  validates :body, length: { minimum: 5, maximum: 500}
end
