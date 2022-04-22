class ItemCategory < ApplicationRecord
    validates :menuitem_id, presence: true
    validates :category_id, presence: true

    belongs_to :menuitem
    belongs_to :category
end
