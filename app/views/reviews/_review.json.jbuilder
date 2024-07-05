json.extract! review, :id, :calificacion, :contenido, :created_at, :updated_at
json.url review_url(review, format: :json)
