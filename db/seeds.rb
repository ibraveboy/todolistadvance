# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Profile.delete_all
TodoItem.delete_all
TodoList.delete_all


User.create(
    [
        {
            username:"Fiorina",
            password_digest:"1954"
        },
        {
            username:"Trump",
            password_digest:"1946"
        },
        {
            username:"Carson",
            password_digest:"1951"
        },
        {
            username:"Clinton",
            password_digest:"1947"
        }
    ]
)
users=User.all.to_a
Profile.create(
    [
        {   
            first_name:"Carly",
            last_name:"Fiorina",
            gender:"female",
            birth_year:1954,
        },
        {
            first_name:"Donald",
            last_name:"Trump",
            gender:"male",
            birth_year:1946,
        },
        {
            first_name:"Ben",
            last_name:"Carson",
            gender:"male",
            birth_year:1951,
        },
        {
            first_name:"Hillary",
            gender:"female",
            last_name:"Clinton",
            birth_year:1947,
        }
    ]
)

20.times do |i|
    TodoItem.create({
        title:"SomeTitle#{i}",
        description:"Description#{i}",
        completed:true,
        due_date:(Date.today+1.year)
    })
end 
items=TodoItem.all.to_a
j=0;
4.times do |i|
    list=TodoList.create(
        {
            list_name:"SomeName#{i}",
            list_due_date:(Date.today+1.year)
        }
    )
    5.times do 
        list.todo_items << items[j]
        j=j+1
    end
    users[i].todo_lists << list
    
end

profiles=Profile.all.to_a
lists=TodoList.all.to_a

outer=0
inner=0
for user in users do
    
    user.profile=profiles[outer]
    
    user.save
    outer=outer+1
end

