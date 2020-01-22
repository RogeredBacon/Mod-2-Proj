class Message < ApplicationRecord
  belongs_to :friendship
  serialize :data
end
