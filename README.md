# Builder

The **builder** is a component for a static site generator.

## But why?

As part of restructuring my website (yet again), I decided to switch to Markdown to write my content. After taking a look at already existing options (modifying my [current website backbone](https://www.nmke.de/index.php), [Github Pages](https://github.com/pages), [Bearblog](https://bearblog.dev), [Smol Pub](http://smol.pub), [ssg](https://romanzolotarev.com/ssg.html), [Hugo](https://gohugo.io/)), I decided to restart from scratch (yet again) and to do it myself (if for nothing else than the thrill of it) (and also yet again).

The (planned) backbone works as follows: A (pre-existing) **compiler** (i.e. [smu](https://github.com/karlb/smu) or [md2html](https://github.com/md4c/md4c)) converts Markdown to HTML. The result of this is then pasted together by the [**replacer**](https://github.com/nmke-de/replacer). Finally, a **builder** (this here) writes the output into the targets for each input file.

## Dependencies

Other than a POSIX compliant shell and coreutils (busybox or sbase should work too, but this is not tested), the script calls the **replacer**, which is availabe as a git submodule. You can fetch it with `git submodule update --init --remote` and update it with `git submodule update --remote`.

## Usage

`./build [source-directory] [target-directory]`

