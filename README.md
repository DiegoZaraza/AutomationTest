# Automation Test

This is a project to test a ebay shoes search in store [Ebay-Store](http://www.ebay.com/)

## Getting Started

Follow these instructions you should do to run the tests.

### Prerequisites

Install the next software for run the test:

 - `Homebrew` 2.2.2
 - `ruby` 2.6.5
 - `ChromeDriver`

### Installing

Run this command for install gems:

```
bundle install
```

In the `feature\support\env.rb` file is the variable `@to_email` where you can put the recipient's mail.

## Running the tests

To run the automated tests, you execute the next command:

```
cucumber --format pretty --expand --format json -o "report.json"
```

The result of the execution is sent to the configured email

**Diego Andres Zaraza** - [diegozaraza](https://github.com/diegozaraza)
