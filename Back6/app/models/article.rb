class Article < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles, dependent: :destroy
  attr_accessor :likes_count, :is_like
end
