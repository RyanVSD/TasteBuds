import 'objects/post.dart';

final List<Post> dummyPosts = [
  Post(
    id: '0',
    title: 'Granny Sue BLT Sandwich',
    imageUrl:
        'https://www.allrecipes.com/thmb/-KMNhU0p6KIc_FuAhjj-RtousSs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/AR-209578-blt-DDMFS-3x4-e1e67e3c348645ba85e304249fd43ff9.jpg',
    author: 'Granny Sue',
    likes: 478,
    favorites: 1234,
    ingredients: [
      '4 slices of bacon',
      '2 leaves of lettuce',
      '2 slices of tomato',
      '2 slices of bread, toasted',
      '1 tablespoon of mayonnaise',
    ],
    steps: [
      'Cook bacon in a large, deep skillet over medium-high heat until evenly browned, about 10 minutes. Drain bacon on a paper towel-lined plate.',
      'Arrange cooked bacon, lettuce, and tomato slices on one slice of bread.',
      'Spread mayonnaise on the other slice of bread, and place it on top to make a sandwich.',
    ],
    ratings: {
      'taste': 4,
      'difficulty': 2,
      'price': 4,
    },
  ),
  // Add more posts here if needed
  Post(
    id: '1',
    title: 'Classic Margherita Pizza',
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0274/9503/9079/files/20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg?v=1723650067',
    author: 'Granny Sue',
    likes: 892,
    favorites: 2341,
    ingredients: [
      '1 pizza dough',
      '1/2 cup tomato sauce',
      '8 oz fresh mozzarella cheese, sliced',
      'Fresh basil leaves',
      '1 tablespoon olive oil',
      '1/2 teaspoon salt',
    ],
    steps: [
      'Preheat the oven to 475°F (245°C).',
      'Roll out the pizza dough on a floured surface to your desired thickness.',
      'Spread the tomato sauce evenly over the dough.',
      'Place fresh mozzarella slices evenly over the pizza.',
      'Bake for 10-12 minutes until the cheese is melted and bubbly.',
      'Remove from the oven, top with fresh basil, and drizzle with olive oil.',
      'Slice and enjoy!',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 3,
      'price': 4,
    },
  ),

  // 🍩 Post 3: Homemade Chocolate Donuts
  Post(
    id: '2',
    title: 'Homemade Chocolate Donuts',
    imageUrl:
        'https://kitchen335co.com/wp-content/uploads/2023/06/glazed-chocolate-donuts-thumbnail.jpg',
    author: 'Granny Sue',
    likes: 1254,
    favorites: 1987,
    ingredients: [
      '2 cups all-purpose flour',
      '1/2 cup cocoa powder',
      '1 teaspoon baking powder',
      '1/2 teaspoon salt',
      '3/4 cup sugar',
      '1 cup milk',
      '1/4 cup melted butter',
      '2 eggs',
      '1 teaspoon vanilla extract',
      '1/2 cup chocolate glaze',
    ],
    steps: [
      'Preheat oven to 375°F (190°C) and grease a donut pan.',
      'In a bowl, whisk together flour, cocoa powder, baking powder, and salt.',
      'In another bowl, whisk sugar, milk, melted butter, eggs, and vanilla.',
      'Gradually mix wet ingredients into dry ingredients until combined.',
      'Pour the batter into a greased donut pan and bake for 10-12 minutes.',
      'Let cool, then dip in melted chocolate glaze before serving.',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 3,
      'price': 4,
    },
  ),

  // 🥗 Post 4: Fresh Avocado & Quinoa Salad
  Post(
    id: '3',
    title: 'Fresh Avocado & Quinoa Salad',
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/california-quinoa-avocado-salad-820b6ba.jpg?quality=90&resize=440,400',
    author: 'Granny Sue',
    likes: 742,
    favorites: 1395,
    ingredients: [
      '1 cup cooked quinoa',
      '1 avocado, diced',
      '1/2 cup cherry tomatoes, halved',
      '1/4 cup feta cheese, crumbled',
      '1/4 cup chopped cucumber',
      '2 tablespoons olive oil',
      '1 tablespoon lemon juice',
      'Salt and pepper to taste',
    ],
    steps: [
      'Cook quinoa according to package instructions and let cool.',
      'In a bowl, combine quinoa, avocado, tomatoes, feta, and cucumber.',
      'Drizzle with olive oil and lemon juice, then toss gently.',
      'Season with salt and pepper as desired.',
      'Serve immediately or chill for 30 minutes for enhanced flavor.',
    ],
    ratings: {
      'taste': 4,
      'difficulty': 2,
      'price': 4,
    },
  ),
  Post(
    id: '4',
    title: 'Uncle Joe’s Spicy Chili',
    imageUrl:
        'https://ladleandgrain.com/wp-content/uploads/2020/12/spicy_chili-4.jpg',
    author: 'Uncle Joe',
    likes: 532,
    favorites: 897,
    ingredients: [
      '1 lb ground beef',
      '1 can kidney beans',
      '1 can diced tomatoes',
      '1 onion, chopped',
      '2 cloves garlic, minced',
      '1 tablespoon chili powder',
      '1 teaspoon cumin',
      'Salt and pepper to taste',
    ],
    steps: [
      'In a large pot, brown ground beef over medium heat. Drain excess fat.',
      'Add onions and garlic, cook until soft.',
      'Stir in chili powder, cumin, salt, and pepper.',
      'Add diced tomatoes and kidney beans, bring to a simmer.',
      'Cook for 30 minutes, stirring occasionally.',
      'Serve hot with shredded cheese or sour cream.',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 3,
      'price': 3,
    },
  ),

  Post(
    id: '5',
    title: 'Aunt Patty’s Secret Mac & Cheese',
    imageUrl:
        'https://www.budgetbytes.com/wp-content/uploads/2023/03/BakedMacandCheesesidespoon.jpg',
    author: 'Aunt Patty',
    likes: 789,
    favorites: 1564,
    ingredients: [
      '2 cups elbow macaroni',
      '2 cups shredded cheddar cheese',
      '1 cup milk',
      '2 tablespoons butter',
      '1 tablespoon flour',
      'Salt and pepper to taste',
      '1/2 cup breadcrumbs (optional)',
    ],
    steps: [
      'Cook macaroni according to package instructions and drain.',
      'In a saucepan, melt butter over medium heat and stir in flour to make a roux.',
      'Gradually add milk, stirring constantly until smooth.',
      'Stir in shredded cheese until melted.',
      'Mix cheese sauce with cooked macaroni.',
      'Optional: Transfer to a baking dish, sprinkle breadcrumbs, and bake at 375°F for 15 minutes.',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 2,
      'price': 3,
    },
  ),

  Post(
    id: '6',
    title: 'Grandpa Tom’s Hearty Beef Stew',
    imageUrl:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2023/09/Beef-Stew-9.jpg',
    author: 'Grandpa Tom',
    likes: 654,
    favorites: 1203,
    ingredients: [
      '1 lb beef stew meat, cubed',
      '3 carrots, chopped',
      '2 potatoes, diced',
      '1 onion, chopped',
      '2 cloves garlic, minced',
      '4 cups beef broth',
      '1 tablespoon Worcestershire sauce',
      '1 teaspoon thyme',
      'Salt and pepper to taste',
    ],
    steps: [
      'In a large pot, brown beef over medium heat.',
      'Add onions and garlic, cook until fragrant.',
      'Pour in beef broth and Worcestershire sauce.',
      'Add carrots, potatoes, thyme, salt, and pepper.',
      'Simmer for 2 hours, stirring occasionally, until beef is tender.',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 3,
      'price': 4,
    },
  ),

  Post(
    id: '7',
    title: 'Chef Lisa’s Classic Pancakes',
    imageUrl:
        'https://www.marthastewart.com/thmb/O75E9rwQRD3F1Q4zFKWDrdsg15c=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/338185-basic-pancakes-09-00b18f8418fd4e52bb2050173d083d04.jpg',
    author: 'Chef Lisa',
    likes: 845,
    favorites: 2034,
    ingredients: [
      '1 cup all-purpose flour',
      '1 tablespoon sugar',
      '1 teaspoon baking powder',
      '1/2 teaspoon salt',
      '1 cup milk',
      '1 egg',
      '2 tablespoons melted butter',
      '1 teaspoon vanilla extract',
    ],
    steps: [
      'In a bowl, whisk together flour, sugar, baking powder, and salt.',
      'In another bowl, beat milk, egg, melted butter, and vanilla extract.',
      'Combine wet and dry ingredients, stirring until just mixed.',
      'Heat a skillet over medium heat and lightly grease.',
      'Pour 1/4 cup of batter onto the skillet for each pancake.',
      'Cook until bubbles form, then flip and cook until golden brown.',
    ],
    ratings: {
      'taste': 5,
      'difficulty': 1,
      'price': 2,
    },
  ),
];
