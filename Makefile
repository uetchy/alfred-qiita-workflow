ALFRED_WORKFLOW_PATH ?= ~/Library/Application Support/Alfred 3/Alfred.alfredpreferences/workflows
BUNDLE_ID = io.uechi.alfred-workflow.qiita
PACKAGE_FILE = info.plist
SYMLINK_TARGET = ${ALFRED_WORKFLOW_PATH}/${BUNDLE_ID}

default: build

build:
	dep ensure
	gox -osarch="darwin/amd64" -output="workflow/bin/alfred-qiita-workflow"

link:
	ln -sf "$(PWD)/workflow" "${SYMLINK_TARGET}"

unlink:
	rm "${SYMLINK_TARGET}"
