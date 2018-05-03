require "./models"

User.create(username: "orlandoc", password: "12345", email:"orlando@nycda.com", birthday:Time.now)
Post.create(title:"title", content:"content", user_id:1)
Post.create(title:"title", content:"content2", user_id:1)
Post.create(title:"title", content:"content3", user_id:1)