# Rails Tests
I use these test cases to reproduce issues in Rails, or to understand how
something works.

These test cases are modified version of the bug report templates [that exists
in Rails itself].

[that exists in Rails itself]: https://github.com/rails/rails/blob/master/guides/bug_report_templates

## Installation

```sh
% git clone https://github.com/rails/rails
# Setup rails by following their CONTRIBUTING documentation.
% git clone https://github.com/teoljungberg/rails-tests
% cd rails-tests
```

That's it.

## Usage

Modify the test case that fits your needs, and they all are runnable as such:

```sh
% ruby active_record/postgres_test.rb
```

The version of Rails can also modified at runtime:

`EDGE=1` will use the local checked out version of Rails.

```
% EDGE=1 active_record/postgres_test.rb
```

`VERSION=5.2.0` will use the given version, in this case 5.2.0

```
% VERSION=5.2.0 active_record/postgres_test.rb
```

No arguments will use the latest and greatest released version.
