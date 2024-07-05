class Message < ApplicationRecord
  belongs_to :user
  belongs_to :solicitud
  after_create_commit { broadcast_append_to "messages" }
end
