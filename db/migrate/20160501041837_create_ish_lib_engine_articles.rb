class CreateIshLibEngineArticles < ActiveRecord::Migration
  def change
    create_table :ish_lib_engine_articles do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
