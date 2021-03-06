# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :password_digest
      t.timestamps
    end
  end
end
