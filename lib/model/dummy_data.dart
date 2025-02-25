import 'package:tastebuds/model/objects/ingredient.dart';
import 'package:tastebuds/model/objects/unit.dart';

import 'objects/post.dart';

// final List<Post> dummyPosts = [
//   Post(
//     id: '0',
//     title: 'Developer Hell Spaghetti',
//     imageUrl:
//         'https://photos.thetrek.co/wp-content/uploads/2019/01/25205359/IMG_5933-250x250.jpg',
//     author: 'God',
//     likes: 99999999,
//     favorites: 99999991,
//     ingredients: [
//       Ingredient(value: 1000, unit: "gram", name: "spaghetti"),
//       Ingredient(value: 2000, unit: "pound", name: "spaghetti"),
//       Ingredient(value: 5, unit: "kilogram", name: "spaghetti"),
//       Ingredient(value: 50, unit: "cup", name: "spaghetti"),
//       Ingredient(value: 10000, unit: "teaspoon", name: "spaghetti"),
//       Ingredient(value: 500, unit: "tablespoon", name: "spaghetti"),
//       Ingredient(value: 800, unit: "ounce", name: "spaghetti"),
//       Ingredient(value: 150, unit: "fluidOunce", name: "spaghetti"),
//       Ingredient(value: 3, unit: "gallon", name: "spaghetti"),
//       Ingredient(value: 50, unit: "quart", name: "spaghetti"),
//       Ingredient(value: 5000, unit: "milliliter", name: "spaghetti"),
//       Ingredient(value: 100, unit: "decalitre", name: "spaghetti"),
//       Ingredient(value: 1000, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 1, unit: "liter", name: "spaghetti"),
//       Ingredient(value: 200, unit: "gram", name: "spaghetti"),
//       Ingredient(value: 10, unit: "pound", name: "spaghetti"),
//       Ingredient(value: 500, unit: "kilogram", name: "spaghetti"),
//       Ingredient(value: 2, unit: "ounce", name: "spaghetti"),
//       Ingredient(value: 20, unit: "gill", name: "spaghetti"),
//       Ingredient(value: 100, unit: "fluidOunce", name: "spaghetti"),
//       Ingredient(value: 5, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 30, unit: "quart", name: "spaghetti"),
//       Ingredient(value: 300, unit: "gallon", name: "spaghetti"),
//       Ingredient(value: 1 / 2, unit: "cup", name: "spaghetti"),
//       Ingredient(value: 1 / 4, unit: "pound", name: "spaghetti"),
//       Ingredient(value: 3 / 4, unit: "kilogram", name: "spaghetti"),
//       Ingredient(value: 1 / 8, unit: "liter", name: "spaghetti"),
//       Ingredient(value: 1 / 10, unit: "gallon", name: "spaghetti"),
//       Ingredient(value: 3 / 5, unit: "teaspoon", name: "spaghetti"),
//       Ingredient(value: 1 / 3, unit: "tablespoon", name: "spaghetti"),
//       Ingredient(value: 1 / 2, unit: "ounce", name: "spaghetti"),
//       Ingredient(value: 7 / 8, unit: "fluidOunce", name: "spaghetti"),
//       Ingredient(value: 1 / 6, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 1 / 12, unit: "quart", name: "spaghetti"),
//       Ingredient(value: 3 / 16, unit: "cup", name: "spaghetti"),
//       Ingredient(value: 5 / 8, unit: "pound", name: "spaghetti"),
//       Ingredient(value: 9 / 10, unit: "kilogram", name: "spaghetti"),
//       Ingredient(value: 11 / 20, unit: "tablespoon", name: "spaghetti"),
//       Ingredient(value: 7 / 10, unit: "ounce", name: "spaghetti"),
//       Ingredient(value: 15 / 16, unit: "gill", name: "spaghetti"),
//       Ingredient(value: 3 / 8, unit: "gallon", name: "spaghetti"),
//       Ingredient(value: 13 / 20, unit: "fluidOunce", name: "spaghetti"),
//       Ingredient(value: 1 / 9, unit: "quart", name: "spaghetti"),
//       Ingredient(value: 2 / 3, unit: "cup", name: "spaghetti"),
//       Ingredient(value: 1 + 1 / 2, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 3 + 5 / 8, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 100 + 4 / 6, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 999 + 7 / 8, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 5 + 1 / 4, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 5 + 3 / 4, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 5 + 3 / 8, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 1324 + 13 / 20, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 1234 + 6 / 34, unit: "pint", name: "spaghetti"),
//       Ingredient(value: 1432 + 12 / 23, unit: "pint", name: "spaghetti"),
//     ],
//     steps: [
//       "Follow the ancient texts",
//       "1. Cucinae praeparatio incepit.",
//       "2. Primo, in medio calore, omnis oleum in sartagine calefaciendum est, ut prima ingrediens lente incipiat frangere et sponte suum suavitatis odorem exhibere.",
//       "3. Temperaturam regere necesse est.",
//       "4. Dum ingredientes confestim parantur, diligenter speciem et formam in cochleari permutandum est, atque coctura etiam temperatura sublevanda.",
//       "5. Utensilia paravit, et incipit coquere.",
//       "6. Misce omnia elementa in recipiente amplio, dum saepe agitantur, ne res in sapore frangantur aut finem amittant, donec perfecta consistit mixtura.",
//       "7. Agitare, ut sapores se misceant.",
//       "8. Primo, ingredientes in olla immittuntur et lente ad temperaturam idealem calefaciunt, ut bene coquantur sine periculo amissae texturae.",
//       "9. Fas est servire aut comedere.",
//       "10. Cum omnia confestim completum sunt, paulisper refrigerare permittitur, ut textura et aspectus stabiliores sint.",
//       "11. Tempus est ingrediens temperare, dum alias partes mixturae parantur ad initium finalis processum.",
//       "12. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       "13. Ut ingrediens in tempestate exacta colligitur, multa sapores et texturas se inter se conferunt et in aequilibrio temperantur.",
//       "14. Itaque, coniunctio saporum cum subtilitate fieri potest, ut lenti motu cum calore aequabili sint pervagati in mixtura, quae saporem perfectum generat.",
//       "15. Nunc vero, in multis gradibus operatio procedit, donec omnem partem pervagata est, simulque elementa nova emergunt.",
//       "16. Nonne ita sit, ut fermentum usque ad aequilibrium hoc modo ferat, dum nova saporum generationes magis ac magis completur per processus instinctivos, qui in una parte distincta unificati sunt.",
//       "17. Postquam omnia satis cocta sunt, effusa liquida mixtura, in novo recipiente dispensa, ad conservandum perficitur, quod antecessores in scriptis suis et sapientiam praecepit, ut omnia aptissime coquerentur ad ultimum perfectionis gradum."
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 5,
//       'price': 5,
//     },
//   ),
//   Post(
//     id: '1',
//     title: 'Classic Margherita Pizza',
//     imageUrl:
//         'https://cdn.shopify.com/s/files/1/0274/9503/9079/files/20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg?v=1723650067',
//     author: 'Granny Sue',
//     likes: 892,
//     favorites: 2341,
//     ingredients: [
//       Ingredient.noUnit(value: 1, name: "pizza dough"),
//       Ingredient(value: 1 / 2, unit: "tablespoon", name: "tomato sauce"),
//       Ingredient(
//           value: 8, unit: "ounce", name: "fresh mozzarella cheese, sliced"),
//       // When value is 0, toString will just print the name alone
//       Ingredient.noUnit(value: 0, name: "Fresh basil leaves"),
//       Ingredient(value: 1, unit: "tablespoon", name: "olive oil"),
//       Ingredient(value: 1 / 2, unit: "teaspoon", name: "salt"),
//     ],
//     steps: [
//       'Preheat the oven to 475°F (245°C).',
//       'Roll out the pizza dough on a floured surface to your desired thickness.',
//       'Spread the tomato sauce evenly over the dough.',
//       'Place fresh mozzarella slices evenly over the pizza.',
//       'Bake for 10-12 minutes until the cheese is melted and bubbly.',
//       'Remove from the oven, top with fresh basil, and drizzle with olive oil.',
//       'Slice and enjoy!',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 3,
//       'price': 4,
//     },
//   ),

//   // 🍩 Post 3: Homemade Chocolate Donuts
//   Post(
//     id: '2',
//     title: 'Homemade Chocolate Donuts',
//     imageUrl:
//         'https://kitchen335co.com/wp-content/uploads/2023/06/glazed-chocolate-donuts-thumbnail.jpg',
//     author: 'Granny Sue',
//     likes: 1254,
//     favorites: 1987,
//     ingredients: [
//       Ingredient(value: 2, unit: "cup", name: "all-purpose flour"),
//       Ingredient(value: 1 / 2, unit: "cup", name: "cocoa powder"),
//       Ingredient(value: 1, unit: "teaspoon", name: "baking powder"),
//       Ingredient(value: 1 / 2, unit: "teaspoon", name: "salt"),
//       Ingredient(value: 3 / 4, unit: "cup", name: "sugar"),
//       Ingredient(value: 1, unit: "cup", name: "milk"),
//       Ingredient(value: 1 / 4, unit: "cup", name: "melted butter"),
//       Ingredient.noUnit(value: 2, name: ""),
//       Ingredient(value: 1, unit: "teaspoon", name: "vanilla extract"),
//       Ingredient(value: 1 / 2, unit: "cup", name: "chocolate glaze"),
//     ],
//     steps: [
//       'Preheat oven to 375°F (190°C) and grease a donut pan.',
//       'In a bowl, whisk together flour, cocoa powder, baking powder, and salt.',
//       'In another bowl, whisk sugar, milk, melted butter, eggs, and vanilla.',
//       'Gradually mix wet ingredients into dry ingredients until combined.',
//       'Pour the batter into a greased donut pan and bake for 10-12 minutes.',
//       'Let cool, then dip in melted chocolate glaze before serving.',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 3,
//       'price': 4,
//     },
//   ),

//   // 🥗 Post 4: Fresh Avocado & Quinoa Salad
//   Post(
//     id: '3',
//     title: 'Fresh Avocado & Quinoa Salad',
//     imageUrl:
//         'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/california-quinoa-avocado-salad-820b6ba.jpg?quality=90&resize=440,400',
//     author: 'Granny Sue',
//     likes: 742,
//     favorites: 1395,
//     ingredients: [
//       Ingredient(value: 1, unit: "cup", name: "cooked quinoa"),
//       Ingredient.noUnit(value: 1, name: "avocado, diced"),
//       Ingredient(value: 1 / 2, unit: "cup", name: "cherry tomatoes, halved"),
//       Ingredient(value: 1 / 4, unit: "cup", name: "feta cheese, crumbled"),
//       Ingredient(value: 1 / 4, unit: "cup", name: "chopped cucumber"),
//       Ingredient(value: 2, unit: "tablespoon", name: "olive oil"),
//       Ingredient(value: 1, unit: "tablespoon", name: "lemon juice"),
//       Ingredient.noUnit(value: 0, name: "Salt and pepper to taste"),
//     ],
//     steps: [
//       'Cook quinoa according to package instructions and let cool.',
//       'In a bowl, combine quinoa, avocado, tomatoes, feta, and cucumber.',
//       'Drizzle with olive oil and lemon juice, then toss gently.',
//       'Season with salt and pepper as desired.',
//       'Serve immediately or chill for 30 minutes for enhanced flavor.',
//     ],
//     ratings: {
//       'taste': 4,
//       'difficulty': 2,
//       'price': 4,
//     },
//   ),

//   Post(
//     id: '4',
//     title: 'Uncle Joe’s Spicy Chili',
//     imageUrl:
//         'https://ladleandgrain.com/wp-content/uploads/2020/12/spicy_chili-4.jpg',
//     author: 'Uncle Joe',
//     likes: 532,
//     favorites: 897,
//     ingredients: [
//       Ingredient(value: 1, unit: "pound", name: "ground beef"),
//       Ingredient.noUnit(value: 1, name: "can kidney beans"),
//       Ingredient.noUnit(value: 1, name: "can diced tomatoes"),
//       Ingredient.noUnit(value: 1, name: "onion, chopped"),
//       Ingredient.noUnit(value: 2, name: "cloves garlic, minced"),
//       Ingredient(value: 1, unit: "tablespoon", name: "chili powder"),
//       Ingredient(value: 1, unit: "teaspoon", name: "cumin"),
//       Ingredient.noUnit(value: 0, name: "Salt and pepper to taste"),
//     ],
//     steps: [
//       'In a large pot, brown ground beef over medium heat. Drain excess fat.',
//       'Add onions and garlic, cook until soft.',
//       'Stir in chili powder, cumin, salt, and pepper.',
//       'Add diced tomatoes and kidney beans, bring to a simmer.',
//       'Cook for 30 minutes, stirring occasionally.',
//       'Serve hot with shredded cheese or sour cream.',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 3,
//       'price': 3,
//     },
//   ),

//   Post(
//     id: '5',
//     title: 'Aunt Patty’s Secret Mac & Cheese',
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2023/03/BakedMacandCheesesidespoon.jpg',
//     author: 'Aunt Patty',
//     likes: 789,
//     favorites: 1564,
//     ingredients: [
//       Ingredient(value: 2, unit: "cup", name: "elbow macaroni"),
//       Ingredient(value: 2, unit: "cup", name: "shredded cheddar cheese"),
//       Ingredient(value: 1, unit: "cup", name: "milk"),
//       Ingredient(value: 2, unit: "tablespoon", name: "butter"),
//       Ingredient(value: 1, unit: "tablespoon", name: "flour"),
//       Ingredient.noUnit(value: 0, name: "Salt and pepper to taste"),
//       Ingredient(value: 1 / 2, unit: "cup", name: "breadcrumbs (optional)"),
//     ],
//     steps: [
//       'Cook macaroni according to package instructions and drain.',
//       'In a saucepan, melt butter over medium heat and stir in flour to make a roux.',
//       'Gradually add milk, stirring constantly until smooth.',
//       'Stir in shredded cheese until melted.',
//       'Mix cheese sauce with cooked macaroni.',
//       'Optional: Transfer to a baking dish, sprinkle breadcrumbs, and bake at 375°F for 15 minutes.',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 2,
//       'price': 3,
//     },
//   ),

//   Post(
//     id: '6',
//     title: 'Grandpa Tom’s Hearty Beef Stew',
//     imageUrl:
//         'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2023/09/Beef-Stew-9.jpg',
//     author: 'Grandpa Tom',
//     likes: 654,
//     favorites: 1203,
//     ingredients: [
//       Ingredient(value: 1, unit: "pound", name: "beef stew meat, cubed"),
//       Ingredient.noUnit(value: 3, name: "carrots, chopped"),
//       Ingredient.noUnit(value: 2, name: "potatoes, diced"),
//       Ingredient.noUnit(value: 1, name: "onion, chopped"),
//       Ingredient.noUnit(value: 2, name: "cloves garlic, minced"),
//       Ingredient(value: 4, unit: "cup", name: "beef broth"),
//       Ingredient(value: 1, unit: "tablespoon", name: "Worcestershire sauce"),
//       Ingredient(value: 1, unit: "teaspoon", name: "thyme"),
//       Ingredient.noUnit(value: 0, name: "Salt and pepper to taste"),
//     ],
//     steps: [
//       'In a large pot, brown beef over medium heat.',
//       'Add onions and garlic, cook until fragrant.',
//       'Pour in beef broth and Worcestershire sauce.',
//       'Add carrots, potatoes, thyme, salt, and pepper.',
//       'Simmer for 2 hours, stirring occasionally, until beef is tender.',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 3,
//       'price': 4,
//     },
//   ),

//   Post(
//     id: '7',
//     title: 'Chef Lisa’s Classic Pancakes',
//     imageUrl:
//         'https://www.marthastewart.com/thmb/O75E9rwQRD3F1Q4zFKWDrdsg15c=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/338185-basic-pancakes-09-00b18f8418fd4e52bb2050173d083d04.jpg',
//     author: 'Chef Lisa',
//     likes: 845,
//     favorites: 2034,
//     ingredients: [
//       Ingredient(value: 1, unit: "cup", name: "all-purpose flour"),
//       Ingredient(value: 1, unit: "tablespoon", name: "sugar"),
//       Ingredient(value: 1, unit: "teaspoon", name: "baking powder"),
//       Ingredient(value: 1 / 2, unit: "teaspoon", name: "salt"),
//       Ingredient(value: 1, unit: "cup", name: "milk"),
//       Ingredient.noUnit(value: 1, name: "egg"),
//       Ingredient(value: 2, unit: "tablespoon", name: "melted butter"),
//       Ingredient(value: 1, unit: "teaspoon", name: "vanilla extract"),
//     ],
//     steps: [
//       'In a bowl, whisk together flour, sugar, baking powder, and salt.',
//       'In another bowl, beat milk, egg, melted butter, and vanilla extract.',
//       'Combine wet and dry ingredients, stirring until just mixed.',
//       'Heat a skillet over medium heat and lightly grease.',
//       'Pour 1/4 cup of batter onto the skillet for each pancake.',
//       'Cook until bubbles form, then flip and cook until golden brown.',
//     ],
//     ratings: {
//       'taste': 5,
//       'difficulty': 1,
//       'price': 2,
//     },
//   ),
//   Post(
//     id: '8',
//     title: 'Granny Sue BLT Sandwich',
//     imageUrl:
//         'https://www.allrecipes.com/thmb/-KMNhU0p6KIc_FuAhjj-RtousSs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AR-209578-blt-DDMFS-3x4-e1e67e3c348645ba85e304249fd43ff9.jpg',
//     author: 'Granny Sue',
//     likes: 478,
//     favorites: 1234,
//     ingredients: [
//       Ingredient.noUnit(value: 4, name: 'slices of bacon'),
//       Ingredient.noUnit(value: 2, name: 'leaves of lettuce'),
//       Ingredient.noUnit(value: 2, name: 'slices of tomato'),
//       Ingredient.noUnit(value: 2, name: 'slices of bread, toasted'),
//       Ingredient(value: 1, unit: "tablespoon", name: 'mayonnaise'),
//     ],
//     steps: [
//       'Cook bacon in a large, deep skillet over medium-high heat until evenly browned, about 10 minutes. Drain bacon on a paper towel-lined plate.',
//       'Arrange cooked bacon, lettuce, and tomato slices on one slice of bread.',
//       'Spread mayonnaise on the other slice of bread, and place it on top to make a sandwich.',
//     ],
//     ratings: {
//       'taste': 4,
//       'difficulty': 2,
//       'price': 4,
//     },
//   ),
//   Post(
//       id: '9',
//       title: 'conversion test',
//       imageUrl:
//           'https://photos.thetrek.co/wp-content/uploads/2019/01/25205359/IMG_5933-250x250.jpg',
//       author: 'Elon Musk',
//       likes: 420,
//       favorites: 420,
//       ingredients: [
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti"),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.teaspoon),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.tablespoon),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.cup),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.pint),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.quart),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.gallon),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.fluidOunce),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.milliliter),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.liter),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.decalitre),
//         Ingredient(value: 5, unit: "milliliter", name: "spaghetti")
//           ..convertTo(UnitType.gill),
//       ],
//       steps: [
//         'This is a test for unit conversions'
//       ],
//       ratings: {
//         'taste': 1,
//         'difficulty': 1,
//         'price': 1,
//       })
// ];
