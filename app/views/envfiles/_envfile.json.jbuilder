json.extract! envfile, :id, :filename, :namespace_id, :filetype, :deleted_at, :created_at, :updated_at
json.url envfile_url(envfile, format: :json)
