# Alfred Qiita Workflow

[![Build Status](https://travis-ci.org/uetchy/alfred-qiita-workflow.svg?branch=master)](https://travis-ci.org/uetchy/alfred-qiita-workflow)

![alt tag](https://raw.github.com/uetchy/alfred-qiita-workflow/master/screenshots/qiita-workflow.png)

## Installation

Double-click `Qiita.alfredworkflow` to install Alfred workflow.

## Commands

### Search articles

```
qiita search <query>
```

### Setup personal access token

```
qiita setup <personal access token>
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
$ go get github.com/uetchy/alfred-qiita-workflow
$ cd $GOPATH/github.com/uetchy/alfred-qiita-workflow
$ make build
$ make link
```

If you put Alfred settings to another location, you should run following lines

```
$ ALFRED_WORKFLOW_PATH=/path/to/Alfred.alfredpreferences/workflows make link
```

You can find Alfred preferences path by `mdfind` command like this:

```
$ mdfind Alfred.alfredpreferences
```

### Testing workflow
`soon`
