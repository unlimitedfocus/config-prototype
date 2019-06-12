class CreateEnvfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :envfiles do |t|
      t.string :filename, null: false
      t.belongs_to :namespace, null: false
      t.integer :filetype, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
