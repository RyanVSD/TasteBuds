import { defineStorage } from "@aws-amplify/backend";

export const storage = defineStorage({
	name: "TasteBuds",
	access: (allow) => ({
		"images/*": [allow.authenticated.to(["read", "write", "delete"])],
	}),
});
