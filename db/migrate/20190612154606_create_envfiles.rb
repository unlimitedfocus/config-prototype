class CreateEnvfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :envfiles do |t|
      t.string :filename
      t.belongs_to :namespace
      t.integer :filetype
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
