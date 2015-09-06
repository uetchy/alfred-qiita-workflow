ALFRED_WORKFLOW_PATH ?= ~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows
BUNDLE_ID = co.randompaper.alfred-qiita-workflow
PACKAGE_FILE = info.plist
SYMLINK_TARGET = ${ALFRED_WORKFLOW_PATH}/${BUNDLE_ID}

build:
	go get ./...
	go build

run:
	go run *.go

dist:
	gox -osarch="darwin/amd64" -output="bin/{{.OS}}_{{.Arch}}"

link:
	ln -sf "$(PWD)" "${SYMLINK_TARGET}"

unlink:
	rm "${SYMLINK_TARGET}"
