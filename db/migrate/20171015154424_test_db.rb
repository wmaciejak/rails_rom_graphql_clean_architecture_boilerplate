ROM::SQL.migration do
  up do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
    create_table :users do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :email, String
      column :username, String
    end

    create_table :posts do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :content, String
      column :title, String, null: false
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      foreign_key :user_id, :users, type: :uuid, on_delete: :cascade, null: false
    end

    create_table :comments do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :content, String
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      foreign_key :author_id, :users, type: :uuid, on_delete: :cascade, null: false
      foreign_key :post_id, :posts, type: :uuid, on_delete: :cascade, null: false
    end
  end

  down do
    run 'DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE'
    drop_table(:users)
    drop_table(:posts)
    drop_table(:comments)
  end
end
