class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :description
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
