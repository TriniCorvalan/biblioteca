class Book < ApplicationRecord

    enum status: %w[prestado disponible]

end
