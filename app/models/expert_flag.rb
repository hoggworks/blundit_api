class ExpertFlag < ApplicationRecord
    belongs_to :expert, touch: true
    belongs_to :flag
end
