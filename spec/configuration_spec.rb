require 'spec_helper'

describe Dbspec::Configuration do
  let(:configuration) { Dbspec::Configuration.new }

  describe "host" do
    subject { configuration.host }

    context "when specified" do
      before { configuration.set(:host, "example.com") }
      it "should be specified value" do
         expect(subject).to eq "example.com"
      end
    end

    context "when not specified" do
      it { expect(subject).to eq "localhost" }
    end
  end

  describe "database" do
    subject { configuration.database }

    context "when specified" do
      before { configuration.set(:database, "schema_name") }
      it "should be specified value" do
        expect(subject).to eq "schema_name"
      end
    end

    context "when not specified" do
      it { expect(subject).to be_nil }
    end
  end

  describe "user" do
    subject { configuration.user }

    context "when specified" do
      before { configuration.set(:user, "user_name") }
      it "should be specified value" do
        expect(subject).to eq "user_name"
      end
    end

    context "when not specified" do
      it { expect(subject).to be_nil }
    end
  end

  describe "password" do
    subject { configuration.password }

    context "when specified" do
      before { configuration.set(:password, "password") }
      it { expect(subject).to eq "password" }
    end

    context "when not specified" do
      it { expect(subject).to eq "" }
    end
  end

  describe "invalid key" do
    context "when set with invalid key" do
      let(:key) { :invalid_key }
      let(:error_message) { "Configuration key name '#{key}' is invalid." }

      it do
        expect{ configuration.set(key, :any_value) }.to raise_error(Dbspec::InvalidConfigurationKeyError, error_message)
      end
    end

    context "when get with invalid key" do
      it do
        expect{ configuration.invalid_key }.to raise_error NoMethodError
      end
    end
  end
end
