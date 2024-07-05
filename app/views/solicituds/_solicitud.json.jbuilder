json.extract! solicitud, :id, :descripcion, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
