
puts "Start seeding..."

Like.destroy_all
Tweet.destroy_all
User.destroy_all

puts "Seeding users..."

# Create 1 admin user with email admin@mail.com and password supersecret

admin = User.new(username: "admin", email: "admin@mail.com", name: "Admin", password: "supersecret", role: "admin")
puts "Admin not created. Errors: #{admin.errors.full_messages}"  unless admin.save

# Create 4 members 

tanus = User.new(username: "tanus", email: "tanus@mail.com", name: "The Great Tanus", password: "qwerty")
tanus.avatar.attach(io: File.open("db/img/avatars/avatar.png"), filename: "avatar.png")
puts "Tanus not created. Errors: #{tanus.errors.full_messages}"  unless tanus.save

goku = User.new(username: "goku2022", email: "goku@dbz.com", name: "Son Goku", password: "qwerty")
goku.avatar.attach(io: File.open("db/img/avatars/avatar-1.png"), filename: "avatar-1.png")
puts "Goku not created. Errors: #{goku.errors.full_messages}"  unless goku.save

diego = User.new(username: "diego", email: "diego@mail.com", name: "Diego Torres", password: "qwerty")
diego.avatar.attach(io: File.open("db/img/avatars/avatar-2.png"), filename: "avatar-2.png")
puts "Diego not created. Errors: #{diego.errors.full_messages}"  unless diego.save

dogfire = User.new(username: "dogfire", email: "dogfire@mail.com", name: "House on Fire", password: "qwerty")
dogfire.avatar.attach(io: File.open("db/img/avatars/avatar-3.png"), filename: "avatar-3.png")
puts "Dogfire not created. Errors: #{dogfire.errors.full_messages}"  unless dogfire.save

neil = User.new(username: "drRealNeil", email: "drneil@mail.com", name: "The Real Neil", password: "qwerty")
neil.avatar.attach(io: File.open("db/img/avatars/avatar-4.png"), filename: "avatar-4.png")
puts "Neil not created. Errors: #{neil.errors.full_messages}"  unless neil.save

# Each member should create some tweets

puts "Seeding tweets..."

neil.tweets.create(body: "For me, I am driven by two main philosophies: know more today about the world than I knew yesterday and lessen the suffering of others.")

dogfire.tweets.create(body: "This is fine, everything is fine.")

diego.tweets.create(body: "Everyone share some kind of ‘quote’, should I as well?")

goku.tweets.create(body: "Even a low class warrior can surpass an elite. With enough hard work.")

tanus.tweets.create(body: "This universe is finite, its resources, finite… if life is left unchecked, life will cease to exist.")

puts "Seeding tweet replies..."

tweet = tanus.tweets.first
tweet.replies.create(body: "I would rather be a brainless monkey than a heartless monster.", user: goku)
tweet.replies.create(body: "When you want to respond and don't know how.", user: dogfire)
tweet.replies.create(body: "Let’s sit and talk about it.", user: diego)

tweet_1 = goku.tweets.first
tweet_1.replies.create(body: "I am the strongest.", user: tanus)
tweet_1.replies.create(body: "Don’t be so hard on yourself.", user: dogfire)
tweet_1.replies.create(body: "The best way to predict the future is to create it.", user: neil)

tweet_2 = diego.tweets.first
tweet_2.replies.create(body: "Do you have a favorite quote?", user: tanus)
tweet_2.replies.create(body: "Can you repeat the question?", user: goku)
tweet_2.replies.create(body: "Are you sure about that?", user: dogfire)

tweet_3 = dogfire.tweets.first
tweet_3.replies.create(body: "This is fine.", user: tanus)
tweet_3.replies.create(body: "Everything is fine.", user: goku)

tweet_4 = neil.tweets.first
tweet_4.replies.create(body: "All I know is that I know nothing.", user: tanus)
tweet_4.replies.create(body: "I am not a number, I am a free", user: goku)

puts "Seeding likes..."

tanus.likes.create(tweet: Tweet.first)  
goku.likes.create(tweet: Tweet.first)
dogfire.likes.create(tweet: Tweet.first)
diego.likes.create(tweet: Tweet.first)
neil.likes.create(tweet: Tweet.first)

tanus.likes.create(tweet: Tweet.second)
goku.likes.create(tweet: Tweet.second)
dogfire.likes.create(tweet: Tweet.second)
diego.likes.create(tweet: Tweet.second)

tanus.likes.create(tweet: Tweet.third)
goku.likes.create(tweet: Tweet.third)
dogfire.likes.create(tweet: Tweet.third)

tanus.likes.create(tweet: Tweet.fourth)
goku.likes.create(tweet: Tweet.fourth)

tanus.likes.create(tweet: Tweet.fifth)

puts "Seeding done!"