import { type ClientSchema, a, defineData } from "@aws-amplify/backend";

// Define schema models
// TODO: EVERYTHING IS OPEN RIGHT NOW, AFTER IMPLEMENTING USER AUTH UPDATE THE RULESETS

const schema = a.schema({
	Author: a
		.model({
			username: a.string().required(),
			favoritedPosts: a.hasMany("Post", "authorId"),
			posts: a.hasMany("Post", "authorId"),
		})
		.authorization((allow) => [allow.guest()]),

	Post: a
		.model({
			// Fields
			title: a.string().required(),
			imageUrl: a.string().required(),
			steps: a.string().array().required(),
			likes: a.integer().required(),
			favorites: a.integer().required(),
			difficulty: a.float().required(),
			price: a.float().required(),

			// Parents
			authorId: a.id().required(),
			author: a.belongsTo("Author", "authorId"),

			// Children
			ingredients: a.hasMany("Ingredient", "postId"),
		})
		.authorization((allow) => [allow.guest()]),
	Ingredient: a
		.model({
			postId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
		})
		.authorization((allow) => [allow.guest()]),
	Unit: a.model({}).authorization((allow) => [allow.guest()]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
	schema,
	authorizationModes: {
		defaultAuthorizationMode: "iam",
	},
});

/*== STEP 2 ===============================================================
Go to your frontend source code. From your client-side code, generate a
Data client to make CRUDL requests to your table. (THIS SNIPPET WILL ONLY
WORK IN THE FRONTEND CODE FILE.)

Using JavaScript or Next.js React Server Components, Middleware, Server 
Actions or Pages Router? Review how to generate Data clients for those use
cases: https://docs.amplify.aws/gen2/build-a-backend/data/connect-to-API/
=========================================================================*/

/*
"use client"
import { generateClient } from "aws-amplify/data";
import type { Schema } from "@/amplify/data/resource";

const client = generateClient<Schema>() // use this Data client for CRUDL requests
*/

/*== STEP 3 ===============================================================
Fetch records from the database and use them in your frontend component.
(THIS SNIPPET WILL ONLY WORK IN THE FRONTEND CODE FILE.)
=========================================================================*/

/* For example, in a React component, you can use this snippet in your
  function's RETURN statement */
// const { data: todos } = await client.models.Todo.list()

// return <ul>{todos.map(todo => <li key={todo.id}>{todo.content}</li>)}</ul>
