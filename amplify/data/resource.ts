import { type ClientSchema, a, defineData } from "@aws-amplify/backend";
import { postConfirmation } from "../auth/post-confirmation/resource";
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

// Functions

// Schema
const schema = a
	.schema({
		// Queries

		// Custom types
		Units: a.enum(Units),

		Ingredient: a.customType({
			name: a.string().required(),
			unit: a.ref("Units").required(),
			value: a.float().required(),
		}),

		// Models
		User: a.model({
			// Fields
			id: a.id(),
			username: a.string().required(),
			preferredUsername: a.string().required(),

			// Cached values
			followerCount: a.integer().required(),
			followingCount: a.integer().required(),
			completedRecipeCount: a.integer().required(),

			// Graph edges
			likes: a.hasMany("LikePost", "userId"),
			favorites: a.hasMany("FavoritePost", "userId"),
			following: a.hasMany("Follow", "followerId"),
			followers: a.hasMany("Follow", "followeeId"),
			posts: a.hasMany("Post", "authorId"),
			completed: a.hasMany("CompletedRecipe", "userId"),
		}),

		Post: a.model({
			// Fields
			id: a.id(),
			authorId: a.id(),

			title: a.string().required(),
			description: a.string().required(),
			imageUrl: a.string().required(),
			steps: a.string().array().required(),

			uploadTime: a.datetime(),

			likes: a.integer().required(),
			favorites: a.integer().required(),
			difficulty: a.float().required(),

			price: a.float().required(),

			ingredients: a.ref("Ingredient").array().required(),

			// Graph edges
			author: a.belongsTo("User", "authorId"),
			favoritedBy: a.hasMany("FavoritePost", "postId"),
			likedBy: a.hasMany("LikePost", "postId"),
			tags: a.hasMany("PostTag", "postId"),
			completed: a.hasMany("CompletedRecipe", "recipeId"),
		}),

		Tag: a.model({
			// fields
			value: a.string(),

			// graph edges
			posts: a.hasMany("PostTag", "tagId"),
		}),

		// Graph edges
		PostTag: a.model({
			postId: a.id().required(),
			tagId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
			tag: a.belongsTo("Tag", "tagId"),
		}),

		FavoritePost: a.model({
			postId: a.id().required(),
			userId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
			user: a.belongsTo("User", "userId"),
		}),

		LikePost: a.model({
			postId: a.id().required(),
			userId: a.id().required(),
			post: a.belongsTo("Post", "postId"),
			user: a.belongsTo("User", "userId"),
		}),

		Follow: a.model({
			followerId: a.id().required(),
			followeeId: a.id().required(),
			follower: a.belongsTo("User", "followerId"),
			followee: a.belongsTo("User", "followeeId"),
		}),

		CompletedRecipe: a.model({
			userId: a.id().required(),
			recipeId: a.id().required(),
			completedAt: a.datetime(),
			difficultyRating: a.integer().required(),
			tasteRating: a.integer().required(),
			user: a.belongsTo("User", "userId"),
			recipe: a.belongsTo("Post", "recipeId"),
		}),
	})
	// ALLOWS ANYONE TO ACCESS ALL DATA
	// REMOVE LATER
	.authorization((allow) => [
		allow.authenticated(),
		allow.resource(postConfirmation),
	]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
	schema,
	authorizationModes: {
		defaultAuthorizationMode: "userPool",
	},
});
