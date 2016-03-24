# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"


# This filter stores environment variables as subfields in the `@metadata` field.
# You can then use these values in other parts of the pipeline.
#
# Adding environment variables is as easy as:
#    filter {
#      environment {
#        add_metadata_from_env { "field_name" => "ENV_VAR_NAME" }
#      }
#    }
#
# Accessing stored environment variables is now done through the `@metadata` field:
#
#    ["@metadata"]["field_name"]
#
# This would reference field `field_name`, which in the above example references
# the `ENV_VAR_NAME` environment variable.
#
# IMPORTANT: Previous versions of this plugin put the environment variables as
# fields at the root level of the event.  Current versions make use of the
# `@metadata` field, as outlined.  You have to change `add_field_from_env` in
# the older versions to `add_metadata_from_env` in the newer version.
class LogStash::Filters::Environment < LogStash::Filters::Base
  config_name "environment"

  # Specify a hash of field names and the environment variable name with the
  # value you want imported into Logstash. For example:
  #
  #    add_metadata_from_env { "field_name" => "ENV_VAR_NAME" }
  #
  # or
  #
  #    add_metadata_from_env {
  #      "field1" => "ENV1"
  #      "field2" => "ENV2"
  #      # "field_n" => "ENV_n"
  #    }
  config :add_metadata_from_env, :validate => :hash, :default => {}

  public
  def register
    # Nothing
  end # def register

  public
  def filter(event)
    
    @add_metadata_from_env.each do |field, env|
      event["[@metadata][#{field}]"] = ENV[env]
    end
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Environment
