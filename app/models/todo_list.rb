class TodoList < ActiveRecord::Base
    belongs_to :user, class_name: "User"
    has_many :todo_items, class_name: "TodoItem", dependent: :destroy
    default_scope {order(list_due_date: :asc)}
    
end
