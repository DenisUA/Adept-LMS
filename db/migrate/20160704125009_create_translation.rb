class CreateTranslation < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :input_text
      t.string :output_text
      t.string :source_language
      t.string :target_language
      t.integer :pid

      t.timestamps null: false
    end
  end
end
