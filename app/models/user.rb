class User < ActiveRecord::Base
    has_one :profile, class_name: "Profile", dependent: :destroy
    has_many :todo_lists, class_name: "TodoList", dependent: :destroy
    has_many :todo_items, through: :todo_lists, source: :todo_items,dependent: :destroy
    validates :username, presence: true

    def get_completed_count 
        return self.todo_items.where({completed:true}).to_a.length
    end
    
end
