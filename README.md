# README
POC - Rust in Rails, using Rutie gem.
Rails app + Postgres db in Docker container.

Currently simply passes an array to Rust, reverses the array and returns it to Ruby :-)

![array_in_out](https://user-images.githubusercontent.com/3944042/152605732-5abed288-ef64-4ca2-b829-13703a65024b.png)

When the Rust `lib.rs` is edited and recompiled to a release binary, the Docker container needs to be restarted for the changes to take effect.
If compiling on Mac, cross-compilation to a Linux binary is needed (which is not covered here, and will involve the use of additional compilation libraries). This is because the Docker container runs a Linux image.

Basic structure is a mixture of experimentation from 2 of my repos, both of which lean heavily on basic doumentation and specific articles (see readme in repos for more details):
- https://github.com/jinjagit/rails-pg-in-docker
- https://github.com/jinjagit/rust-on-rails

## Next steps
- [x] Pass something into Rust method from Ruby, and print it out.
- [x] Pass something from Rust to Ruby.
- [x] Pass array in & out of Rust method.
- [x] Develop analogy of blocked_words check for benchmarking

## Quickstart

Assuming Docker is installed:
```
docker-compose build
docker-compose run web rails webpacker:install
docker-compose run web rake db:create db:migrate db:seed
docker-compose up
```
Open app in browser @ `localhost:3000`

[If you are on Linux, you may need to run `sudo chown -R $USER:$USER .` to take ownership of the files]
