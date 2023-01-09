class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.string :poster
      t.integer :password

      t.timestamps
    end
  end
end
