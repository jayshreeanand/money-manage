class Receipt < ApplicationRecord
  belongs_to :transaction
  
  validates :document_image, presence: true

  mount_uploader :document_image, DocumentImageUploader
end
