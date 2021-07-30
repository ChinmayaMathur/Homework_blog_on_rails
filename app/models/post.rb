class Post < ApplicationRecord
      #---------------------CALLBACKS----------------------------------->
      before_save :capitalize_title
      has_many :comments, dependent: :destroy
      belongs_to :user, optional: true


      #--------------------VALIDATIONS------------------------------------>
      validates :title, presence: {message: "title must be provided"}
      
      validates :title, uniqueness: {scope: :body}
  
      validates :body, length: {minimum: 50, maximum: 500}


      private

      def capitalize_title
            self.title.capitalize!
      end

end