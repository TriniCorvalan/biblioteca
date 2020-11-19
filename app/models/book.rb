class Book < ApplicationRecord
    # validates :title, presence: true
    enum status: %w[prestado disponible]

end
