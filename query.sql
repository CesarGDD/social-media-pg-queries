-- name: GetUser :one
SELECT * FROM users
WHERE username = $1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY id;

-- name: CreateUser :one
INSERT INTO users (username, bio, avatar, email, password)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;

-- name: UpdateUser :one
UPDATE users
SET bio = $2, avatar = $3
WHERE id = $1
RETURNING *;

-- name: DeleteUser :one
DELETE FROM users
WHERE id = $1
RETURNING *;


-- name: GetPost :one
SELECT * FROM posts
WHERE id = $1;

-- name: ListPosts :many
SELECT * FROM posts
ORDER BY id;

-- name: CreatePost :one
INSERT INTO posts (url, caption, user_id)
VALUES ($1, $2, $3)
RETURNING *;

-- name: UpdatePost :one
UPDATE posts
SET url = $2, caption = $3
WHERE id = $1
RETURNING *;

-- name: DeletePost :one
DELETE FROM posts
WHERE id = $1
RETURNING *;

-- name: GetComment :one
SELECT * FROM comments
WHERE id = $1;

-- name: ListComments :many
SELECT * FROM comments
ORDER BY id;

-- name: CreateComment :one
INSERT INTO comments (contents, user_id, post_id)
VALUES ($1, $2, $3)
RETURNING *;

-- name: UpdateComment :one
UPDATE comments
SET contents = $2
WHERE id = $1
RETURNING *;

-- name: DeleteComment :one
DELETE FROM comments
WHERE id = $1
RETURNING *;

-- name: ListLikes :many
SELECT * FROM likes
ORDER BY id;

-- name: CreateLike :one
INSERT INTO likes (user_id, post_id, comment_id)
VALUES ($1, $2, $3)
RETURNING *;

-- name: DeleteLike :one
DELETE FROM likes
WHERE id = $1
RETURNING *;

-- name: GetHashtag :one
SELECT * FROM hashtags
WHERE title = $1;

-- name: ListHashtags :many
SELECT * FROM hashtags
ORDER BY id;

-- name: CreateHashtag :one
INSERT INTO hashtags (title)
VALUES ($1)
RETURNING *;

-- name: UpdateHashtag :one
UPDATE hashtags
SET title = $2
WHERE id = $1
RETURNING *;

-- name: DeleteHashtag :one
DELETE FROM hashtags
WHERE id = $1
RETURNING *;

-- name: GetFollower :one
SELECT * FROM followers
WHERE id = $1;

-- name: ListFollowers :many
SELECT * FROM followers
ORDER BY id;

-- name: CreateFollower :one
INSERT INTO followers (leader_id, follower_id)
VALUES ($1, $2)
RETURNING *;

-- name: DeleteFollower :one
DELETE FROM followers
WHERE id = $1
RETURNING *;