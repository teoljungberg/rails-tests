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
% ruby active_record/postgres/test_case.rb
```
