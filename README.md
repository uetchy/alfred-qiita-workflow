# Alfred Qiita Workflow

[![Build Status](https://travis-ci.com/uetchy/alfred-qiita-workflow.svg?branch=master)](https://travis-ci.com/uetchy/alfred-qiita-workflow)

![alt tag](https://raw.github.com/uetchy/alfred-qiita-workflow/master/screenshots/qiita-workflow.png)

## Installation

Download [latest version of Alfred Qiita Workflow](https://github.com/uetchy/alfred-qiita-workflow/releases/latest) and double-click `Qiita.alfredworkflow` to install it.

## Commands

### Search articles

```
qiita search <query>
```

### Setup personal access token

Get [Personal Access Token](https://qiita.com/settings/tokens/new) which have a scope for _read_qiita_ and put it on:

```
qiita setup <personal access token>
```

### List and search stocked articles

You MUST set access token in advance.

```
qiita stocks <query:optional>
```

### List and search your articles

You MUST set access token in advance.

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

### Development installation

Run following commands to link this workflow with Alfred.

```
$ go get github.com/uetchy/alfred-qiita-workflow
$ cd $GOPATH/github.com/uetchy/alfred-qiita-workflow
$ make build
$ make link
```

If you put Alfred settings to another location, you should run following lines:

```
$ ALFRED_WORKFLOW_PATH=/path/to/Alfred.alfredpreferences/workflows make link
```

You can find Alfred preferences path by `mdfind` command:

```
$ mdfind Alfred.alfredpreferences
```
