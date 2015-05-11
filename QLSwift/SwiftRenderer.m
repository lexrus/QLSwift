//
// QLSwift
// https://github.com/lexrus/QLSwift
//
// Copyright © 2015 Lex Tang, http://LexTang.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//
// SwiftRenderer.m
// Created by Lex Tang on 5/11/15.
//

#import "SwiftRenderer.h"

NSData *renderSwiftWithHTML(NSURL* url)
{
    NSStringEncoding usedEncoding = 0;
    NSError *readError = nil;
    
    NSString *source = [NSString stringWithContentsOfURL:url usedEncoding:&usedEncoding error:&readError];
    
    if (usedEncoding == 0) {
        NSLog(@"Failed to determine encoding for file %@", [url path]);
    }
    
    NSString *cssPath = [[NSBundle bundleWithIdentifier:@"com.LexTang.QLSwift"] pathForResource:@"monokai_sublime" ofType:@"css"];
    NSString *cssContent = [NSString stringWithContentsOfFile:cssPath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    NSString *jsPath = [[NSBundle bundleWithIdentifier:@"com.LexTang.QLSwift"] pathForResource:@"highlight.pack" ofType:@"js"];
    NSString *jsContent = [NSString stringWithContentsOfFile:jsPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    
    NSString *html = [NSString stringWithFormat:@"<!DOCTYPE html>"
                      "<html><meta charset=utf-8>"
                      "<style>*{margin:0;padding:0}body{background:#232323}%@</style>"
                      "<script>%@</script>"
                      "<script>hljs.initHighlightingOnLoad();</script>"
                      "<body><pre><code class='swift'>%@</code></pre></body></html>",
                      cssContent,
                      jsContent,
                      [NSString stringWithCString:source.UTF8String encoding:NSUTF8StringEncoding]];
    
    return [html dataUsingEncoding:NSUTF8StringEncoding];
}

