# Noembed — oEmbed everything.

![](https://github.com/noembed/noembed/workflows/CI/badge.svg)

## Requirements

- Perl 5 (5.32.0)
- cpanminus

## Installation

`cpanm --installdeps .`

## Run as Perl PSGI service

`plackup -Ilib bin/noembed.psgi`

## Run with Docker

 docker run -p5000:5000 noembed/noembed:1.0.alpha2
