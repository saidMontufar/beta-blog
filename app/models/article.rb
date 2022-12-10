class Article < ApplicationRecord
  validates :title, precense: true, length: { minimum: 6, maximum: 100 }
  validates :description, precense: true, length: { minimum: 10, maximum: 300 }
end
