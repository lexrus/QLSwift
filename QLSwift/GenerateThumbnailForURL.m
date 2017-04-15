//
// QLSwift
// https://github.com/lexrus/QLSwift
//
// Copyright © 2017 Lex Tang, http://lexrus.com
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

@import Cocoa;
@import CoreFoundation;
@import CoreServices;
@import QuickLook;
@import WebKit;
#import "SwiftRenderer.h"

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize);
void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail);

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
    NSStringEncoding usedEncoding = 0;
    NSError *readError = nil;
    
    NSString *source = [NSString stringWithContentsOfURL:(__bridge NSURL*)url usedEncoding:&usedEncoding error:&readError];
    
    if (usedEncoding == 0) {
        NSLog(@"Failed to determine encoding for file %@", [(__bridge NSURL*)url path]);
        return noErr;
    }
    
    source = [NSString stringWithCString:source.UTF8String encoding:NSUTF8StringEncoding];
    
    // Load water mark
    
    NSURL *iconURL = [[NSBundle bundleWithIdentifier:@"com.LexTang.QLSwift"] URLForResource:@"SwiftWaterMark" withExtension:@"png"];
    NSImage *appIcon = [[NSImage alloc] initWithContentsOfURL:iconURL];
    CGFloat iconScale = appIcon.size.width / maxSize.width;
    
    NSRect renderRect = NSMakeRect(0.0, 0.0, maxSize.width, maxSize.height);
    CGFloat iconHeight = appIcon.size.height / iconScale;
    NSRect iconRect = NSMakeRect(0.0, maxSize.height - iconHeight, maxSize.width, iconHeight);
    
    CGContextRef context = QLThumbnailRequestCreateContext(thumbnail, maxSize, false, NULL);
    if (context) {
        NSGraphicsContext* graphicsContext = [NSGraphicsContext graphicsContextWithGraphicsPort:(void *)context flipped:NO];
        
        [NSGraphicsContext setCurrentContext:graphicsContext];
        [appIcon drawInRect:iconRect];
        
        NSDictionary *textAttributes =
        @{
          NSForegroundColorAttributeName: [NSColor blackColor],
          NSFontAttributeName: [NSFont fontWithName:@"Menlo" size:12]
          };
        [source drawInRect:renderRect withAttributes:textAttributes];
        
        
        QLThumbnailRequestFlushContext(thumbnail, context);
        CFRelease(context);
    }
    
    return noErr;
}

void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail)
{
    // Implement only if supported
}
