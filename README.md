# Alfred Qiita Workflow

![alt tag](https://raw.github.com/oame/alfred-qiita-workflow/master/screenshots/qiita-workflow.png)

# System Requirements

- OS X Mavericks(with Ruby 2.0.0)

## Installation

Double-click `Qiita.alfredworkflow` to install Alfred workflow.

## Commands

### Search items

```
qiita search <query>
```

### Fetch authentication token from Qiita

```
qiita setup <name> <password>
```

### Search stocked items from Qiita

```
qiita stocks <query>
```

## Contributing

### Fork project

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Development Installation

```
$ bundle install
$ bundle exec rake link
```

If you using Alfred with Dropbox Sync folder, you should type `rake link_dropbox` instead of `rake link`.

## Thanks

- [Alfred 2 Ruby Template](https://github.com/zhaocai/alfred2-ruby-template)