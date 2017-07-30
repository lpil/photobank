import * as db from "./db";

interface Post extends db.DbPost {
  author: db.DbAuthor;
}

interface IdEntity {
  id: number;
}

export function hello(root: object, args: object, context: object): string {
  return "Hello, world!";
}

export function posts(
  root: object,
  args: object,
  context: object
): Array<Post> {
  const posts = db.getAllPosts();
  // TODO: Can we avoid loading these if it not asked for?
  const postsWithAuthors = loadPostAuthors(posts);
  return postsWithAuthors;
}

function loadPostAuthors(posts: Array<db.DbPost>): Array<Post> {
  const authors = db.getAuthors(posts.map(post => post.id));
  const authorsDict = idMap(authors);
  return posts.map(post =>
    Object.assign({ author: authors[post.authorId] }, post)
  );
}

type IdEntityMap = { [s: number]: IdEntity };
function idMap(entities: Array<IdEntity>): IdEntityMap {
  const acc: IdEntityMap = {};
  entities.forEach(e => (acc[e.id] = e));
  return acc;
}
