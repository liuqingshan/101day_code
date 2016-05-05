class CategoryProduction < ActiveRecord::Base
   belongs_to :category
   belongs_to :production
end
