user1 = User.create(nickname: 'user1', email: 'test1@mail.com', password: 'test')
user2 = User.create(nickname: 'user2', email: 'test2@mail.com', password: 'test')

post1 = Post.create(title: 'post1', body: 'body', author: user1, published_at: DateTime.now)
Comment.create(body: 'comment1', post: post1)
Comment.create(body: 'comment2', post: post1)
Comment.create(body: 'comment3', post: post1)

post2 = Post.create(title: 'post2', body: 'body', author: user1, published_at: DateTime.now)
Comment.create(body: 'comment1', post: post2)
Comment.create(body: 'comment2', post: post2)
Comment.create(body: 'comment3', post: post2)
Comment.create(body: 'comment4', post: post2)

post3 = Post.create(title: 'post2', body: 'body', author: user2, published_at: DateTime.now)
Comment.create(body: 'comment1', post: post3)
Comment.create(body: 'comment2', post: post3)
Comment.create(body: 'comment3', post: post3)
Comment.create(body: 'comment4', post: post3)
