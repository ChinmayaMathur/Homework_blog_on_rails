# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all

100.times do
      created_at = Faker::Date.backward(days:365 * 5)
            p = Post.create(
            title: Faker::Hacker.say_something_smart,
            body: Faker::ChuckNorris.fact,
            created_at: created_at,
            updated_at: created_at,
            )

            if p.persisted?  
                  p.comments = rand(0..15).times.map do
                        Comment.new(body: Faker::GreekPhilosophers.quote)
                  end
            end
end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts", :cow)
puts Cowsay.say("Generated #{comments.count} comments", :koala)