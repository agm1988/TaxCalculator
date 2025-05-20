## Run the App

```bash
ruby bin/run.rb
````

## Setup App

```bash
bundle install
```

## Run Tests

```bash
rspec
```

## Assumptions
 - Products are matched by keyword (e.g. "book", "chocolate", "pills")
 - Input must be in the format: 1 product name at price

## Improvements
- add logging
- add exception handling
- add more tests
- refactor tests

## Examples
1. Input Example 1:
```ruby
ruby bin/run.rb
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

2. Input Example 2:
```ruby
ruby bin/run.rb
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

3. Input Example 3:
```ruby
ruby bin/run.rb
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```
