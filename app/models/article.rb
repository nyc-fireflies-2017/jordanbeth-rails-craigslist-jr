class Article < ApplicationRecord
  belongs_to :category
  
  validates :title, :body, presence: true
end
