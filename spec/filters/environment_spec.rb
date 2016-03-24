require "logstash/devutils/rspec/spec_helper"
require "logstash/filters/environment"

describe LogStash::Filters::Environment do
  before do
    ENV["MY_ENV_VAR"] = "hello world"
  end

  describe "add a field from the environment" do
    # The logstash config goes here.
    # At this time, only filters are supported.
    config <<-CONFIG
      filter {
        environment {
          add_metadata_from_env => [ "newfield", "MY_ENV_VAR" ]
        }
      }
    CONFIG

    sample "example" do
      insist { subject["@metadata"]["newfield"] } == "hello world"
    end
  end
end
