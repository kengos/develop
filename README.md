# Local programing playground

## Requirements

- Docker version 20.10.10
- docker-compose version 1.29.2

## Programing languages

### Python3(3.10.1-slim-bullseye)

#### Usage(terminal)

```
cd python3
make up
```

```
echo 'print("Hello, world!")' > hello.py
python hello.py
```

### Rust(1.57.0-slim-bullseye)

#### Usage(terminal)

```
cd rust
make up
```

```
echo 'fn main() {' > hello.rs
echo '    println!("Hello, world!");' >> hello.rs
echo '}'  >> hello.rs
rustc hello.rs
./hello
```
