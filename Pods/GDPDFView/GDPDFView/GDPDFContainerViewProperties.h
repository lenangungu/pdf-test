//
// Copyright © 2016 Gavrilov Daniil
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#ifndef GDPDFContainerViewProperties_h
#define GDPDFContainerViewProperties_h

@protocol GDPDFContainerViewProperties <NSObject>

/**
 Determine how much of page should be visible to consider it as 'full visible'
 and allow it to be new current page, value should be between 0.1 and 1.0
 */
@property (nonatomic) CGFloat visibilityFactor;

/**
 Enable or disable activity indicators, default is YES
 */
@property (nonatomic) BOOL shouldShowActivityIndicator;

/**
 Enable or disable thumbnails of pages, default is YES
 */
@property (nonatomic) BOOL shouldShowThumbnails;

/**
 Maximum image size, will be applyed in next drawing cycle
 */
@property (nonatomic) CGSize maximumPageImageSize;

/**
 Thumbnail size, will be applyed in next drawing cycle
 */
@property (nonatomic) CGSize pageThumbnailSize;

@end

#endif /* GDPDFContainerViewProperties_h */
