//
// Get all posts. Allll of them.
//
function getAllPosts() {
  return [
    { id: 1, text: "Hello, world!", authorId: 1 },
    { id: 2, text: "Uh, world, are you there?", authorId: 1 },
    { id: 3, text: "oops, sorry, I was on the phone", authorId: 2 }
  ];
}

//
// Get all the authors with the given ids
//
function getAuthors(ids) {
  return [
    { id: 1, name: "Jane", avatar: "one.png" },
    { id: 2, name: "World", avatar: "two.png" }
  ];
}

module.exports = {
  getAuthors,
  getAllPosts
};
