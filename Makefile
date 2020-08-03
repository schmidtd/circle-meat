# Bootstrap (pull) the build harness

#then $(shell @python3 fred.py); \
# GITHUB_USER containing '@' char must be escaped with '%40'
GITHUB_USER := $(shell echo $(GITHUB_USER) | sed 's/@/%40/g')
GITHUB_TOKEN ?=

BUILD_HARNESS_EXTENSIONS_BRANCH=master

-include $(shell [ -f ".build-harness-bootstrap" ] || curl -sL -o .build-harness-bootstrap -H "Authorization: token $(GITHUB_TOKEN)" -H "Accept: application/vnd.github.v3.raw" "https://raw.github.com/open-cluster-management/build-harness-extensions/master/templates/Makefile.build-harness-bootstrap"; echo .build-harness-bootstrap)
