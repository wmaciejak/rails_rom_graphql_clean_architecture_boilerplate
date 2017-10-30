[![Maintainability](https://api.codeclimate.com/v1/badges/85e2b0f11f46e78fe89b/maintainability)](https://codeclimate.com/github/wmaciejak/rails_rom_graphql_clean_architecture_boilerplate/maintainability)

# Rails 5 + ROM 4 + GraphQL + Clean Architecture example application

This is a sample app which shows how Rails 5, ROM 4.0, GraphQL and Clean Architecture might work together.

## Requirements
- ruby 2.4.2
- postgresql 10

## What's done already

### By libs
- [x] N+1 issue by [BatchLoader](https://github.com/exAspArk/batch-loader/) [app/graphql/types/user_type.rb](https://github.com/wmaciejak/rails_rom_graphql_clean_architecture_boilerplate/blob/master/app/graphql/types/user_type.rb#L8).

### By own implementation - feedback is appreciated!

- [x] modularization of fields in QueryType [app/graphql/query_type.rb](https://github.com/wmaciejak/rails_rom_graphql_clean_architecture_boilerplate/blob/master/app/graphql/query_type.rb#L6)
- [x] Implementation of Clean Architecture
- [x] Separation of seeds by the environment [db/seeds.rb](https://github.com/wmaciejak/rails_rom_graphql_clean_architecture_boilerplate/blob/master/db/seeds.rb)
- [x] Loading relations one-to-many without N+1, fixed by naive implementation - [BatchLoader issue#5](https://github.com/exAspArk/batch-loader/issues/5)
- [x] Modularization project "per feature"
- [x] Global container([dry-container](http://dry-rb.org/gems/dry-container/)) for better using repositories

## What's to be done

- [ ] Abstraction on BatchLoader(more DRY implementation)
- [ ] Sample use case
- [ ] Mutations
- [ ] Tests
- [ ] Sample pagination
- [ ] Translation from queries Abstract Syntax Tree to Ruby Object Mapper API - the best solution is adapter, but it's a future voice

## Known issues

- [x] camelCase in queries(thx [RadoMark](https://github.com/RadoMark/))[fix](https://github.com/wmaciejak/rails_rom_graphql_clean_architecture_boilerplate/commit/e0d0c7fe10f31f37ef3d997a2c056b84f29bf6ed)

## Links

- Application demo GraphiQL: https://rails-graphql-rom-example-app.herokuapp.com/graphiql

## Example Query(can be used in graphiql)

```graphql
query {
  users{
    username
    email
    posts{
      id
      content
      title
      created_at
      updated_at
      comments {
        id
        content
        created_at
        updated_at
        author_id
        post_id
      }
    }
    comments {
        id
        content
        created_at
        updated_at
        author_id
        post_id
    }
  }
}
```
