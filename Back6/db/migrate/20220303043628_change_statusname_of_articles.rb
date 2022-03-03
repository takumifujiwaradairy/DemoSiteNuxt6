class ChangeStatusnameOfArticles < ActiveRecord::Migration[6.1]
  def change
    change_column_default :articles, :status, from: "start", to: "start"
  end
end
