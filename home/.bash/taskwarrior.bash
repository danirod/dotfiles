#!/bin/bash
#
# Inner functions that are useful for my usage of taskwarrior.

# Creates a set of tasks for the flow of a video. The list of tasks
# created are: Write script, Record video, Edit, Upload, Caption
function task_video {
	if [ "$#" -eq 0 ]; then
		echo "Missing parameters"
		return 1
	fi

	# One for writing the script
	task $TASKFLAGS add Write script $*
	SCRIPT_ID=$(task $TASKFLAGS +LATEST ids)

	# One for recording the video, depending on the script
	echo task $TASKFLAGS add Record video $* depends:$SCRIPT_ID
	task $TASKFLAGS add Record video $* depends:$SCRIPT_ID
	RECORD_ID=$(task $TASKFLAGS +LATEST ids)

	# One for editing the video, depending on the previously recorded
	echo task $TASKFLAGS add Edit video $* depends:$RECORD_ID
	task $TASKFLAGS add Edit video $* depends:$RECORD_ID
	EDIT_ID=$(task $TASKFLAGS +LATEST ids)

	# One for uploading the video, depending on the video edited
	echo task $TASKFLAGS add Upload video $* depends:$EDIT_ID
	task $TASKFLAGS add Upload video $* depends:$EDIT_ID

	# And another one to caption the video, also depending on having it edited.
	echo task $TASKFLAGS add Caption video $* depends:$EDIT_ID
	task $TASKFLAGS add Caption video $* depends:$EDIT_ID
}
