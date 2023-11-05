Bloguser.create(
  name: 'Binod',
  photo: 'https://media.licdn.com/dms/image/D4D35AQEH-qv4vhcKIQ/profile-framedphoto-shrink_400_400/0/1687546729923?e=1699714800&v=beta&t=u-N7p51bihWyS2bVpfcjuCj46xGwQ5NpTAVXWzNkCro',
  bio: 'Elegant solutions to complex problems',
  email: 'binod@gmail.com',
  password: '123456',
  role: 'admin',
  confirmed_at: Time.now
)
Bloguser.create(
  name: 'John',
  photo: 'https://media.istockphoto.com/id/1256127007/pt/foto/close-up-portrait-of-his-he-nice-attractive-glad-cheerful-cheery-guy-pointing-forefinger-aside.jpg?s=1024x1024&w=is&k=20&c=e2ignRblm3z8vwG0k9nEYV5KIgfhqn0d3YzZ1Fnw4jQ=',
  bio: 'Innovation and creative person',
  email: 'john@gmail.com',
  password: '123456',
  role: 'user',
  confirmed_at: Time.now
)
Bloguser.create(
  name: 'Selena',
  photo: 'https://cdn.pixabay.com/photo/2016/11/29/06/46/adult-1867889_1280.jpg',
  bio: 'Innovation and creative person',
  email: 'selena@gmail.com',
  password: '123456',
  role: 'user',
  confirmed_at: Time.now
)
Bloguser.create(
  name: 'Britney',
  photo: 'https://cdn.pixabay.com/photo/2017/07/26/16/32/woman-2542252_1280.jpg',
  bio: 'Beleive knowledge is power',
  email: 'britney@gmail.com',
  password: '123456',
  role: 'user',
  confirmed_at: Time.now
)
Bloguser.create(
  name: 'Joana',
  photo: 'https://cdn.pixabay.com/photo/2017/03/17/04/07/woman-2150881_1280.jpg',
  bio: 'Humble and tech enthusiasts',
  email: 'joana@gmail.com',
  password: '123456',
  role: 'user',
  confirmed_at: Time.now
)
Bloguser.create(
  name: 'Alex',
  photo: 'https://media.istockphoto.com/id/1431057864/pt/foto/modern-business-man-in-casual-blue-shirt-standing-with-crossed-arms-on-blue-background.jpg?s=1024x1024&w=is&k=20&c=GmqCn0uhIDYSJQnWbwQCz6TI53tTZdQdP_VPJN6tIXU=',
  bio: 'Innovation and creative person',
  email: 'alex@gmail.com',
  password: '123456',
  role: 'user',
  confirmed_at: Time.now
)
Post.create(
  author_id: 1,
  title: "How Artificial Intelligence is Transforming the World",
  text: "Despite its widespread lack of familiarity, AI is a technology that is transforming every 
  walk of life. It is a wide-ranging tool that enables people to rethink how we integrate 
  information, analyze data, and use the resulting insights to improve decisionmaking.
   Our hope through this comprehensive overview is to explain AI to an audience of
   policymakers, opinion leaders, and interested observers, and demonstrate how AI 
  already is altering the world and raising important questions for society, the economy, and governance.",
  comments_counter: 0,
  likes_counter: 0
)
Post.create(
  author_id: 1,
  title:"Introduction to React JS",
  text: "React is an open-source JavaScript library for building user interfaces (UIs) in web applications. 
  Developed and maintained by Facebook, React has gained significant popularity due to its flexibility, 
  performance, and the ability to create interactive, dynamic, and reusable UI components
  React is commonly used for building web applications, but its flexibility and component-based architecture 
  have made it a popular choice for building dynamic and interactive user interfaces across a wide range of 
  platforms, from web and mobile to virtual reality applications.",
  comments_counter: 0,
  likes_counter: 0
)
Post.create(
  author_id: 2,
  title: "An overview of Web Development",
  text: "Web development is the process of building and maintaining websites and web 
  applications that are accessible over the internet. It encompasses a wide range of tasks 
  and technologies to create, design, develop, and manage web-based software and content. 
  Here's an overview of web development
  Web development is a multidisciplinary field that can range from creating simple static websites to 
  building complex web applications with dynamic content and interactivity. It's a critical aspect 
  of the modern digital world, as most businesses and organizations have an online presence, and 
  the web continues to be a platform for innovation and communication.",
  comments_counter: 0,
  likes_counter: 0
)
Post.create(
  author_id: 5,
  title: "The Beauty of Nature",
  text: "This word is used in a variety of contexts. Perhaps the most important reference is the multiple
   species of plants, animals, wildlife, and all that the earth contains from topography such as mountains, 
   valleys, beaches, and seas. , And forests. The beauty of nature The nature of man is characterized by its 
   beauty resulting mainly from the wonderful diversity of living organisms that exist in various parts of 
   the earth, as well as the unique terrain of mountains, water, plateaus and forests. Each of these 
   features is distinguished by a special beauty that distinguishes it from Other terrain, and this great 
   diversity gave people wide spaces to seek calm, tranquility, and tranquility.",
  comments_counter: 0,
  likes_counter: 0
)