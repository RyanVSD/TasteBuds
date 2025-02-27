import { defineAuth } from "@aws-amplify/backend";
import { postConfirmation } from "./post-confirmation/resource";
import { preSignUp } from "./pre-sign-up/resources";
/**
 * Define and configure your auth resource
 * @see https://docs.amplify.aws/gen2/build-a-backend/auth
 */
export const auth = defineAuth({
	loginWith: {
		email: true,
	},

	userAttributes: {
		preferredUsername: {
			mutable: true,
			required: true,
		},
		profilePicture: {
			mutable: true,
			required: false,
		},
		birthdate: {
			mutable: true,
			required: false,
		},
	},
	triggers: {
		preSignUp,
		postConfirmation,
	},
});
