class NflPlayer < ApplicationRecord
  default_scope -> { where(active: true) }
end
