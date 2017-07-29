const db = require("./db");

function hello(root, args, context) {
  return "Hello, world!";
}

function posts(root, args, context) {
  const posts = db.getAllPosts();
  // TODO: Can we avoid loading these if it not asked for?
  const postsWithAuthors = loadPostAuthors(posts);
  return postsWithAuthors;
}

function loadPostAuthors(posts) {
  const authors = idMap(db.getAuthors(posts.map(post => post.id)));
  const acc = [];
  posts.forEach(post => {
    const postWithAuthor = Object.assign(
      { author: authors[post.authorId] },
      post
    );
    acc.push(postWithAuthor);
  });
  return acc;
}

function idMap(entities) {
  const acc = {};
  entities.forEach(e => (acc[e.id] = e));
  return acc;
}

module.exports = {
  hello,
  posts
};
