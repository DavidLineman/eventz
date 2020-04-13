class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+\ }

  HOW_HEARD_OPTIONS = {
    'Newsletter',
    'Blog Post',
    'Twitter',
    'Web Post',
    'Friend/Coworker',
    'Other'
  }

  validtates :how_heard,
            :inclusion, { in: HOW_HEARD_OPTIONS }
end
