require 'spec_helper'

describe Dbspec::Connection do
  let(:connection) { Dbspec.connection }
  let(:query) { "SELECT 1 AS a" }

  it "should return a result of query" do
    result = connection.execute(query)
    expect(result.first).to eq({ "a" => 1 })
  end
end
