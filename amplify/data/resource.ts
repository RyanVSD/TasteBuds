import { type ClientSchema, a, defineData } from "@aws-amplify/backend";

// Define schema models
// TODO: EVERYTHING IS OPEN RIGHT NOW, AFTER IMPLEMENTING USER AUTH UPDATE THE RULESETS

let Units = [
	"none",
	"teaspoon",
	"tablespoon",
	"cup",
	"pint",
	"quart",
	"gallon",
	"fluidOunce",
	"milliliter",
	"liter",
	"decalitre",
	"gill",
	"gram",
	"kilogram",
	"ounce",
	"pound",
];

const schema = a
	.schema({
		// Custom types
		Units: a.enum(Units),

		Ingredient: a.customType({
			name: a.string().required(),
			unit: a.ref("Units").required(),
			value: a.float().required(),
		}),

		// Models
		Author: a.model({
			// Fields
			username: a.string().required(),
			// Children
			favorites: a.hasMany("FavoritePost", "authorId"),
			posts: a.hasMany("Post", "authorId"),
		}),

		Post: a.model({
			// Fields
			title: a.string().required(),
			imageUrl: a.string().required(),
			steps: a.string().array().required(),
			likes: a.integer().required(),
			favorites: a.integer().required(),
			difficulty: a.float().required(),
			price: a.float().required(),
			ingredients: a.ref("Ingredient").array().required(),
			// Author relationship
			authorId: a.id().required(),
			author: a.belongsTo("Author", "authorId"),
			// Favorite relationship
			favorited: a.hasMany("FavoritePost", "postId"),
		}),

		FavoritePost: a.model({
			// Parents
			postId: a.id().required(),
			authorId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
			author: a.belongsTo("Author", "authorId"),
		}),
	})
	// ALLOWS ANYONE TO ACCESS ALL DATA
	// REMOVE LATER
	.authorization((allow) => [allow.guest()]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
	schema,
	authorizationModes: {
		defaultAuthorizationMode: "iam",
	},
});

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
