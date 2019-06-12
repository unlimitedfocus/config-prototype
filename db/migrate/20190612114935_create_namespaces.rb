class CreateNamespaces < ActiveRecord::Migration[5.2]
  def change
    create_table :namespaces do |t|
      t.string :team, null: false
      t.string :application, null: false
      t.string :environment, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :namespaces, [:team, :application, :environment], unique: true
    add_index :namespaces, :team
    add_index :namespaces, :application
    add_index :namespaces, :environment
  end
end
