require 'spec_helper'

describe Dbspec::Table do
  let(:table) { Dbspec::Table.new("table_name") }

  describe "columns" do
    subject { table.columns }

    it "should be a Array of Dbspec::Column" do
      expect(subject).to be_a Array
      expect(subject.first).to be_a Dbspec::Column
      expect(subject.first.name).to eq "column_name"
    end
  end

  describe "#has_column?" do
    context "when specified column exists" do
      it "should return true" do
        expect(table).to have_column(:column_name)
      end
    end
  end
end
