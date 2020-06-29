# pts-test-profiles-dev
This repository contains the test-profiles for the Phoronix Test Suite for which I have done bug fixing to improve their compatibility with NetBSD.

This is repository and [pts-test-profiles-patches](https://github.com/apurvanandan1997/pts-test-profiles-patches) will contain the PTS test profiles and patches that I would develop/debug in GSoC 2020 for The NetBSD Foundation.

## Usage
```
$ cd ~/.phoronix-test-suite/test-profiles
$ git clone https://github.com/apurvanandan1997/pts-test-profiles-dev local
```

After cloning the repo in right place, you would be able to list these test profiles by:
```
$ phoronix-test-suite list-available-tests
```

To run one of these test-profile use:
```
$ phoronix-test-suite run local/testname-version
```
For example: 
```
$ phoronix-test-suite run local/mbw-1.0.0
```
