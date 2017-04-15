# QLSwift

[![Github Releases](https://img.shields.io/github/downloads/lexrus/QLSwift/latest/total.svg?style=flat-square)](https://github.com/lexrus/QLSwift/releases)
[![GitHub release](https://img.shields.io/github/release/lexrus/QLSwift.svg?style=flat-square)](https://github.com/lexrus/QLSwift/releases)
![License](https://img.shields.io/github/license/lexrus/QLSwift.svg?style=flat-square)
![Love](https://img.shields.io/badge/build%20with-%3C3-ff69b4.svg?style=flat-square)

A Quick Look plugin for Swift files. Inspired by [QLMarkdown](https://github.com/toland/qlmarkdown).

![qlswiftpreview](https://cloud.githubusercontent.com/assets/219689/7562489/631c18fa-f807-11e4-8a86-32d30b285c5b.jpg)

![qlswiftthumb](https://cloud.githubusercontent.com/assets/219689/7562490/6730637e-f807-11e4-9498-c36437c6e3d9.jpg)

## Installation

### Homebrew

`brew install Caskroom/cask/qlswift`

### Manually

Download the [latest](https://github.com/lexrus/QLSwift/releases/tag/0.0.1) release from 
<https://github.com/lexrus/QLSwift/releases>

Simply copy QLSwift.qlgenerator to `~/Library/QuickLook` or `/Library/QuickLook`.

You should run `qlmanage -r` in terminal in case the Quick Lock cache was not flushed.

To uninstall, drag QLSwift into the trash.

**Note:** *Quick Look doesn't allow selecting text. If you want to select the text in the markdown preview, you will 
need to enable text selection in Quick Look by running the following in Terminal:*

````bash
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
````

## License

This code is distributed under the terms and conditions of the MIT license.

```
The MIT License (MIT)
Copyright © 2017 Lex Tang, http://lexrus.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

```

---

The syntax of Swift is rendered with [Highlight.js](https://github.com/isagalaev/highlight.js)

```
Copyright (c) 2006, Ivan Sagalaev
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of highlight.js nor the names of its contributors 
      may be used to endorse or promote products derived from this software 
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
