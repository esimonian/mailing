class Template < ApplicationRecord

  has_attached_file :image, styles: { large: "500X500", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :campaigns
end
