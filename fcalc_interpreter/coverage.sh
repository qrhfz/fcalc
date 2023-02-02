dart test --coverage=coverage
format_coverage --lcov --in=coverage --out=coverage/coverage.lcov --report-on=lib
genhtml coverage/coverage.lcov -o coverage/html