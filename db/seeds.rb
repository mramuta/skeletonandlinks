require 'faker'

User.delete_all
Entry.delete_all
Comment.delete_all


users = 50.times.map do
  User.create!( :username => Faker::Name.name,
                :password   => 'password' )
end


entries = 10.times.map do
  Entry.create!( :body => Faker::Lorem.paragraph,
                :title => Faker::Lorem.sentence,
                :author_id  => rand(User.first.id..User.last.id))
end

comments = Entry.all.each do |entry|
  rand(1..5).times.map do
    Comment.create!( :body => Faker::Lorem.paragraph,:author_id  => rand(User.first.id..User.last.id),entry_id:entry.id)
  end
end

child_comments = 10.times do 
  Entry.all.each do |entry|
    rand(0..5).times.map do
      Comment.create!( :body => Faker::Lorem.paragraph,:author_id  => rand(User.first.id..User.last.id),entry_id:entry.id, parent_comment_id:entry.comments.ids.sample)
    end
  end
end
