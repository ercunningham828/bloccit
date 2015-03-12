require 'faker'

 #Defines unique post title and unique comment
unique_post="This is a unique post"
unique_comment="This is a unique comment on a random post"

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

 unless Post.where(title: unique_post).exists?
  Post.create!(
     title:  unique_post,
     body:   "Which contains a unique message"
   )
  end

 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 unless Comment.where(body: unique_comment).exists?
  Comment.create!(
     post:  posts.sample,
     body:  unique_comment
   )
end



#Create Unique Post

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"