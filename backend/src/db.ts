export interface DbPost {
  text: string;
}
export interface DbAuthor {
  name: string;
}

interface Post extends db.DbPost {
  author: Array<db.DbAuthor>;
}

//
// Get all posts. Allll of them.
//
export function getAllPosts(): Array<DbPost> {
  return [
    { id: 1, text: "Hello, world!", authorId: 1 },
    { id: 2, text: "Uh, world, are you there?", authorId: 1 },
    { id: 3, text: "oops, sorry, I was on the phone", authorId: 2 }
  ];
}

//
// Get all the authors with the given ids
//
export function getAuthors(ids: Array<number>): Array<DbAuthor> {
  return [
    { id: 1, name: "Jane", avatar: "one.png" },
    { id: 2, name: "World", avatar: "two.png" }
  ];
}
