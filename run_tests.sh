#!/usr/bin/env bash
echo $DB
rm ~/.superset/unittests.db
rm ~/.superset/celerydb.sqlite
rm ~/.superset/celery_results.sqlite
rm -f .coverage
export SUPERSET_CONFIG=tests.superset_test_config
set -e
superset/bin/superset db upgrade
superset/bin/superset db upgrade  # running twice on purpose as a test
superset/bin/superset version -v
python setup.py nosetests
coveralls
