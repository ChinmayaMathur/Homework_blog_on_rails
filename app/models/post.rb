class Post < ApplicationRecord
      #---------------------CALLBACKS----------------------------------->
      # before_save :capitalize_title
      has_many :comments, dependent: :destroy


      #--------------------VALIDATIONS------------------------------------>
      validates :title, presence: {message: "title must be provided"}
      
      validates :title, uniqueness: {scope: :body}
  
      validates :body, length: {minimum: 50, maximum: 500}


      private

      def capitalize_title
            self.title.capitalize!
      end

end