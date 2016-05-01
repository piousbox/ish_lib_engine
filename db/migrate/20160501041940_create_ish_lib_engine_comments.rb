class CreateIshLibEngineComments < ActiveRecord::Migration
  def change
    create_table :ish_lib_engine_comments do |t|
      t.integer :article_id
      t.text :body

      t.timestamps null: false
    end
  end
end
