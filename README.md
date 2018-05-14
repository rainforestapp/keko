# keko

```
Keko: Kemal + Echo
```

Your friendly echo server written in [Crystal](https://crystal-lang.org).


## Installation

- [Install Crystal](https://crystal-lang.org/docs/installation/)

- Clone the repo and install dependencies:

```bash
git clone https://github.com/rainforestapp/keko
cd keko
shards install
```

## Usage

### Development

```bash
crystal src/keko.cr
```

Send a request with payload via curl

```
curl -X POST -F 'name=serdar' -F 'password=1234' http://localhost:3000
```

### Release

```bash
shards build --release
./bin/keko
```

## Development

Run the specs to make sure everything is working.

```bash
KEMAL_ENV=test crystal spec
```
