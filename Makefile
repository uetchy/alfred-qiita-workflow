ALFRED_WORKFLOW_PATH ?= ~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows
BUNDLE_ID = "co.randompaper.alfred-qiita-workflow"
PACKAGE_FILE = "info.plist"

run:
	go run *.go

link:
	TARGET := "$(ALFRED_WORKFLOW_PATH)/$(BUNDLE_ID)"
	# mkdir -p "${TARGET}"
	# ln -sf "`pwd`", "$(TARGET)"

unlink:
	rm "$ALFRED_WORKFLOW_PATH/$BUNDLE_ID"
