class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :content
      t.references :post, index: true, foreign_key: true
      t.string :title
      t.integer :number

      t.timestamps null: false
    end
  end
end
