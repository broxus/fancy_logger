#!/bin/bash

set -e

melos clean
melos bs
melos run check-format --no-select
melos codegen --no-select
melos run analyze --no-select
melos run test --no-select
melos git-check
