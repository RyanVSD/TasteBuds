import 'post.dart';

final List<Post> dummyPosts = [
  Post(
    id: 'p1',
    title: 'Granny Sue BLT Sandwich',
    imageUrl:
        'https://www.foodrepublic.com/img/gallery/yes-banana-and-mayo-belong-on-a-sandwich/l-intro-1722889922.jpg',
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
      'taste': 4.8,
      'difficulty': 2.1,
      'cheapness': 3.7,
    },
  ),
  // Add more posts here if needed
  Post(
    id: 'p2',
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
      'taste': 4.9,
      'difficulty': 3.2,
      'cheapness': 4.0,
    },
  ),

  // 🍩 Post 3: Homemade Chocolate Donuts
  Post(
    id: 'p3',
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
      'taste': 4.7,
      'difficulty': 3.0,
      'cheapness': 4.3,
    },
  ),

  // 🥗 Post 4: Fresh Avocado & Quinoa Salad
  Post(
    id: 'p4',
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
      'taste': 4.5,
      'difficulty': 2.0,
      'cheapness': 4.1,
    },
  ),
];
