class AddContentHtmlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_html, :text, index: true
  end
end
