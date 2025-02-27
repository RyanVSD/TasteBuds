import type { PostConfirmationTriggerHandler } from "aws-lambda";
import { type Schema } from "../../data/resource";
import { Amplify } from "aws-amplify";
import { generateClient } from "aws-amplify/data";
import { getAmplifyDataClientConfig } from "@aws-amplify/backend/function/runtime";
import { env } from "$amplify/env/post-confirmation";

const { resourceConfig, libraryOptions } = await getAmplifyDataClientConfig(
	env
);

Amplify.configure(resourceConfig, libraryOptions);

const client = generateClient<Schema>();

export const handler: PostConfirmationTriggerHandler = async (event) => {
	console.log("CREAITNG USER CUSTOMLOG: ");
	console.log(event);
	console.log(event.request);
	console.log(event.userName);
	await client.models.User.create({
		id: event.request.userAttributes.sub,
		username: event.userName,
		preferredUsername: event.request.userAttributes.preferred_username,
		completedRecipeCount: 0,
		followerCount: 0,
		followingCount: 0,
	});
	return event;
};
