#!/bin/bash

set -o pipefail

# Path to your Markdown files
pandoc_path=${PANDOC_PATH:-./}
# Path to your YML file
yml_path=${YML_PATH:-./}
# Path to put the exported ePub
export_path=${EXPORT_PATH:-./export/}
# Name of the exported file
exported_file=${EXPORTED_FILE:-export.epub}
# Branch to push the changes to
branch=${PANDOC_BRANCH:-main}
# Email id used while committing to the repo
email=${EMAIL:-}
# The commit message
commit_message=${COMMIT_MESSAGE:-Updated Pandoc Exported Files}

# build the ePub
pandoc ${pandoc_path}*.md ${yml_path} -o ${export_path}${exported_file}

# commit the new files
git config --global --add safe.directory /github/workspace

git config --global user.email 
git fetch
git checkout ${branch}
git add ${export_path}/
git commit -m "${commit_message}"
git push origin ${branch}