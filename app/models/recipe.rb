
class Recipe < ApplicationRecord

    # Associations
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_many :recipe_foods, dependent: :destroy
    has_many :foods, through: :recipe_foods

    
    # Validations
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :preparation_time, presence: true, length: { minimum: 1, maximum: 500 }
    validates :cooking_time, presence: true, length: { minimum: 1, maximum: 500 }
    validates :description, presence: true, length: { minimum: 3, maximum: 500 }
    #validates :public, presence: true, length: { minimum: 3, maximum: 500 }

    
    # Scopes
    default_scope -> { order(updated_at: :desc) }
    
    # Methods
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end
    
end
