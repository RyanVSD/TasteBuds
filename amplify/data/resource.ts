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
		User: a.model({
			// Children
			favorites: a.hasMany("FavoritePost", "userId"),
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
			// Favorite relationship
			favorited: a.hasMany("FavoritePost", "postId"),
		}),

		FavoritePost: a.model({
			// Parents
			postId: a.id().required(),
			userId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
			user: a.belongsTo("User", "userId"),
		}),
	})
	// ALLOWS ANYONE TO ACCESS ALL DATA
	// REMOVE LATER
	.authorization((allow) => [allow.guest()]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
	schema,
	authorizationModes: {
		defaultAuthorizationMode: "userPool",
	},
});
