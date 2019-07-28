require 'elasticsearch/model'

class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :content
    end
  end

  belongs_to :user

  validates :content, presence: true
end
