# Dread

// missing_dependents

[![Build Status](https://travis-ci.org/DamirSvrtan/dread.svg?branch=master)](https://travis-ci.org/DamirSvrtan/dread)
[![Code Climate](https://codeclimate.com/github/DamirSvrtan/dread/badges/gpa.svg)](https://codeclimate.com/github/DamirSvrtan/dread)

Never dread about (not) destroying your records again!

Dread provides ways to:
  1. Draw a graph of dependently destroyable associations
  2. Find associations with missing depenent destroys/delets/nullifies

Supports Rails 3.2+ and Ruby 1.9.3+.

## Installation

Add the Dread gem to your Gemfile:

```ruby
group :development do
  gem 'dread', '>= 0.0.7'
end
```

And run `bundle install` within your app's directory.

## Usage

The Dread gem provides a rake task for drawing all dependently destroyable associations.

```bash
$ rake dread class=user

user
    tweets
        comments
            pictures
        pictures
    comments
        pictures
    avatar
```

#### Self joins

```ruby
class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: Employee,
                          foreign_key: "manager_id",
                          dependent: :destroy

  belongs_to :manager, class_name: Employee
end
```

```shell
$ rake dread class=employee

employee
    subordinates
        ...
```

#### Circular dependent destroys

```ruby
class Supplier < ActiveRecord::Base
  has_one :account, dependent: :destroy
end

class Account < ActiveRecord::Base
  belongs_to :supplier, dependent: :destroy
end
```

```shell
$ rake dread class=supplier

supplier
    account
        supplier
            ...
```


### Development

Dread uses [appraisals](https://github.com/thoughtbot/appraisal) to test the code base against multiple versions of Rails.

When first developing, you should run `bundle install` and `appraisal install` to install the all dependencies accross different gemfiles.

Run `appraisal rake` to roll the tests on multiple versions or just run a specific set with `appraisal rails-4.0 rake`.

### Bug reports

If you find a problem with the Dread gem, please submit an [issue](https://github.com/DamirSvrtan/dread/issues), along with the version of Rails you're using and the set of associations that are causing the trouble.

### Contributing

1. Fork it ( http://github.com/DamirSvrtan/dread/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
