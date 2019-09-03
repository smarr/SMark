# SMark
Write Benchmarks like Tests.

SMark is a benchmarking suite for Smalltalk ([Pharo](https://pharo.org) and [Squeak](https://squeak.org) specifically).

## Installation
### Pharo 7+
```smalltalk
Metacello new
    baseline: 'SMark';
    repository: 'github://smarr/SMark';
    load.
```
### Squeak 5.2+
```smalltalk
Installer ensureRecentMetacello.
Metacello new
    baseline: 'SMark';
    repository: 'github://smarr/SMark';
    load.
```
