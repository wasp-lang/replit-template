🚨 IMPORTANT! You must visit your repl's url at port 9000 to correctly preview your app: </br>
✅
https://wasp-replit-template.vincanger.repl.co:9000

⚠️ Make sure to run `wasp db migrate-dev` in the Shell to begin. Look to the console for tips and warnings

🧙‍♂️ Do not edit the contents of the `.wasp` folder (this is where Wasp magically generates your app for you)

------
<p align=center>
  <img height="80px" src="https://user-images.githubusercontent.com/1536647/77317442-78625700-6d0b-11ea-9822-0fb21e557e87.png"/>
</p>
<p align=center>
  A programming language that understands what a web app is.
</p>

------

- [**Home page**](https://wasp-lang.dev)
- [**Docs**](https://wasp-lang.dev/docs)

Wasp (**W**eb **A**pplication **Sp**ecification Language) is a declarative DSL (domain-specific language) for developing, building and deploying modern full-stack web apps with less code.

Describe high-level features with Wasp in the `main.wasp` file, and they will be compiled by `waspc` (Wasp compiler) into a full-stack app (currently React + NodeJS/ExpressJS + Prisma).

```c
// file: main.wasp

app WaspReplit {
  wasp: {
    version: "^0.8.0"
  },
  
  title: "WaspReplit",

  // super simple auth!
  auth: {
    userEntity: User,
    methods: {
      usernameAndPassword: {}, 
    },
    onAuthFailedRedirectTo: "/login",
  }
}

/** <---- Database Entities -----> */

// Uses Prisma Schema Language (PSL) 
// Run `wasp db migrate-dev` in the Shell after making changes

entity User {=psl 
  id          Int     @id @default(autoincrement())
  username    String  @unique
  password    String  
  tasks       Task[]
psl=}

entity Task {=psl
  id          Int     @id @default(autoincrement())
  description String
  isDone      Boolean @default(false)
  user        User?   @relation(fields: [userId], references: [id])
  userId      Int?
psl=}

/** <---- Pages & Routes -----> */

route RootRoute { path: "/", to: MainPage }
page MainPage {
  authRequired: true, // This page requires user to be authenticated.
  component: import Main from "@client/MainPage.jsx"
}

route LoginRoute { path: "/login", to: LoginPage }
page LoginPage {
  component: import Login from "@client/LoginPage.jsx"
}

route SignupRoute { path: "/signup", to: SignupPage }
page SignupPage {
  component: import Signup from "@client/SignupPage.jsx"
}

/** <---- Operations -----> */

query getTasks {
  fn: import { getTasks } from "@server/queries.js",
  entities: [Task]
}

action createTask {
  fn: import { createTask } from "@server/actions.js",
  entities: [Task]
}

action updateTask {
  fn: import { updateTask } from "@server/actions.js",
  entities: [Task]
}
```

Source files (`.wasp`, `.js(x)`, `.css`, ...) are compiled by `waspc` (Wasp compiler) into a truly full-stack web app! (currently React + NodeJS/ExpressJS + Prisma).

