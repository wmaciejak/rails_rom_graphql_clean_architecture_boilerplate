Container.configure do |container|
  container.namespace("repositories") do |repo_container|
    Container.auto_register_repositories(repo_container)
  end
end
