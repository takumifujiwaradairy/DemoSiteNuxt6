class ChangeArticleTagRelationsToTagArticles < ActiveRecord::Migration[6.1]
  def change
    rename_table :article_tag_relations, :tag_articles
  end
end
