class Document < ApplicationRecord
    has_many :document_access
    has_many :users, through: :document_access
end
