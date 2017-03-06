class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :category
      
      t.timestamps
    end
  end
end
