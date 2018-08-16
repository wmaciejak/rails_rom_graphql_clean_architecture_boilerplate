# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GraphQL queries", type: :request, graphql: true do
  describe "sanity check against set of predefined GraphQL queries" do
    queries_path = Rails.root.join(
      "spec", "integrations", "graphql", "support", "queries", "**", "*.gql"
    )
    Dir[queries_path].each do |path|
      context "#{path} query" do
        subject(:run_query) { post("/graphql", params: query_param) }

        let(:query_param) { { query: File.read(path) } }

        it "passes" do
          run_query
          expect(json_body.values_at("errors", "error")).to match_array [nil, nil]
        end
      end
    end
  end
end
