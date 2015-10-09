## 2.0.0
 - Plugins were updated to follow the new shutdown semantic, this mainly allows Logstash to instruct input plugins to terminate gracefully, 
   instead of using Thread.raise on the plugins' threads. Ref: https://github.com/elastic/logstash/pull/3895
 - Dependency on logstash-core update to 2.0
 - Remove the test for filtering on the `type` since we are removing the `filter?`

1.0.0
  - Use @metadata instead of root-level fields
  - This is a breaking change.  Users will need to switch to use @metadata subfields in their configurations.
