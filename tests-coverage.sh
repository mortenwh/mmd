#!/bin/bash

coverage run --omit=tests/* --source mmd_utils mmd_utils/nc_to_mmd.py
coverage report

echo

if [[ -n "$COVERALLS_REPO_TOKEN" ]]
then
  coveralls
else
  echo %%
  echo %% Do you want code coverage generated on https://coveralls.io with GitHub Actions.
  echo %%
  echo "%%   1. Add repository to coveralls.io."
  echo "%%   2. Add a repository secret in [ Setting > Secrets ]."
  echo "%%      Name it COVERALLS_REPO_TOKEN, and use the token from coveralls.io as value."
  echo %%
fi
