Verifies that symbolic links aren't included in test run

# Usage
1. [install yarn](https://yarnpkg.com/en/docs/install) (since that's what jest endorse over npm)
1. Install dependencies by running [`yarn run install`](install.sh), or `./install.sh` directly
1. Execute tests by `yarn test` (current, default behavior) and `yarn test-follow-symlinks` (new flag/behavior, to include symlinked test files).

Example output:
```bash
yarn test
yarn test v0.27.5
$ jest
No tests found
In /Users/nicklas/src/jest-symlinks-probing
  3 files checked.
  testMatch: **/__tests__/**/*.js?(x),**/?(*.)(spec|test).js?(x) - 1 match
  testPathIgnorePatterns: other - 2 matches
Pattern:  - 0 matches
Done in 0.56s.
 ~/src/jest-symlinks-probing  ⑂ master    yarn run test-follow-symlinks
```

```
yarn test-follow-symlinks
$ yarn run v0.27.5
$ jest --followSymlinks
watchman can not be used with followSymlinks, watchman will be disabled
 PASS  src/linked.test.js
  real
    ✓ test (5ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.7s, estimated 1s
Ran all test suites.
Done in 1.33s.
```

# Development
1. `yarn install`
1. Use development build of [viddo/jest](https://github.com/viddo/jest) fork by following official facebook/jest contributor instructions, see ["How to try a development build of Jest in another project"](https://github.com/facebook/jest/blob/master/CONTRIBUTING.md#how-to-try-a-development-build-of-jest-in-another-project)
1. `yarn link jest-cli`
