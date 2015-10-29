# gh-tree-cli

## Installation

```
$ npm install -g bouzuya/gh-tree-cli
```

## Usage

```
$ gh-tree-cli bouzuya/blog.bouzuya.net,bouzuya/bouzuya.net
bouzuya/bouzuya.net#2 issueC https://github.com/bouzuya/bouzuya.net/issues/2
bouzuya/bouzuya.net#1 issueA1 https://github.com/bouzuya/bouzuya.net/issues/1
bouzuya/blog.bouzuya.net#39 issueA https://github.com/bouzuya/blog.bouzuya.net/pull/39
    bouzuya/bouzuya.net#1 issueA1 https://github.com/bouzuya/bouzuya.net/issues/1
bouzuya/blog.bouzuya.net#38 issueB https://github.com/bouzuya/blog.bouzuya.net/pull/38
```

NOTE: If the issue's body start with `<user>/<repo>#<number>`, you can specify the issue as a child. e.g.

```
bouzuya/bouzuya.net#1
title: issueA1
body : bouzuya/blog.bouzuya.net#39
```

### `--root` option

```
$ gh-tree-cli bouzuya/bouzuya.net,bouzuya/blog.bouzuya.net -r bouzuya/bouzuya.net
bouzuya/bouzuya.net#2 issueC https://github.com/bouzuya/bouzuya.net/issues/2
bouzuya/bouzuya.net#1 issueA1 https://github.com/bouzuya/bouzuya.net/issues/1
```

### `--token` option

```
$ gh-tree-cli bouzuya/private-repo -t c57138f60e6104e18c8c16f5dc3bb132787c5915
bouzuya/private-repo#1 secret issue https://github.com/bouzuya/bouzuya.net/issues/1
```

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][email]&gt; ([http://bouzuya.net][url])

[user]: https://github.com/bouzuya
[email]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
