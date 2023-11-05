class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key:{to_table: :blog_users}, null:false, index:true
      t.references :post, foreign_key: {to_table: :posts}, null:false, index:true
      t.text :text

      t.timestamps
    end
  end
end

