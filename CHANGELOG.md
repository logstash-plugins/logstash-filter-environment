# 2.0.4
  - New dependency requirements for logstash-core for the 5.0 release
## 2.0.2
 - Filtering using `tags` or `type` option is now deprecated, please use conditionals Ref: https://github.com/elastic/logstash/pull/4011
## 2.0.0
 - Plugins were updated to follow the new shutdown semantic, this mainly allows Logstash to instruct input plugins to terminate gracefully, 
   instead of using Thread.raise on the plugins' threads. Ref: https://github.com/elastic/logstash/pull/3895
 - Dependency on logstash-core update to 2.0

1.0.0
  - Use @metadata instead of root-level fields
  - This is a breaking change.  Users will need to switch to use @metadata subfields in their configurations.
