class Receipt < ApplicationRecord
  belongs_to :transaction_rec, foreign_key: 'transaction_id', class_name: 'Transaction'
  belongs_to :user

  validates :document_image, presence: true

  mount_uploader :document_image, DocumentImageUploader
end
