# trust-configure

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> A script for adding default configuration to @trust repositories.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)

## Install

```
$ npm i -g @trust/configure
```

## Usage

```
$ trust-configure [ npm-package-name ]
```

* `npm-package-name`: The name of the package that will appear under the `name` field in the `package.json` file. Default: `@trust/<cwd-basedir>`

### Example

```
$ git clone <new-repo>
$ cd new-repo
$ trust-configure
```

## Maintainers

[@EternalDeiwos](https://github.com/EternalDeiwos)

## Contribute

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2017 MIT Connection Science
