# frozen_string_literal: true

class CreatePrestantes < ActiveRecord::Migration[7.2]
  def up
    create_table :prestantes do |t|
      t.string :nome
      t.references :categoria, null: false, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :prestantes
  end
end
