class Article < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations, dependent: :destroy
  attr_accessor :likes_count, :is_like
end
