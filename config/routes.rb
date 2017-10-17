Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  unless Rails.env.production?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
