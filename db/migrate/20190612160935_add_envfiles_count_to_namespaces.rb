class AddEnvfilesCountToNamespaces < ActiveRecord::Migration[5.2]
  def change
    add_column :namespaces, :envfiles_count, :integer
  end
end
