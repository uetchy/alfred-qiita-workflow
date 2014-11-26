# Alfred Qiita Workflow

[![Build Status](https://travis-ci.org/oame/alfred-qiita-workflow.svg?branch=master)](https://travis-ci.org/oame/alfred-qiita-workflow)

![alt tag](https://raw.github.com/oame/alfred-qiita-workflow/master/screenshots/qiita-workflow.png)

## System Requirements

- OS X

## Installation

Double-click `Qiita.alfredworkflow` to install Alfred workflow.

## Commands

### Search articles

```
qiita search <query>
```

### Login and save token

```
qiita setup <name> <password>
```

### Search stocked articles

```
qiita stocks <query:optional>
```

### Search your own articles

```
qiita my <query:optional>
```

## Contributing

### Fork project

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Development Installation

Run folloing commands to link this workflow to Alfred app manually.

```
$ bundle install
$ bundle exec rake link
```

If you put Alfred settings to another location, you should run following lines

```
$ rake link ALFRED_WORKFLOW_PATH=/path/to/Alfred.alfredpreferences/workflows
```

You can find Alfred preferences path by `mdfind` command like this:

```
$ mdfind Alfred.alfredpreferences
```

### Testing workflow
```
$ bundle install
$ bundle exec rspec
```


## Thanks

- [Alfred 2 Ruby Template](https://github.com/zhaocai/alfred2-ruby-template)
