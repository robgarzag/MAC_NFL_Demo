//
//  YouTubeWebView.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "YouTubeWebView.h"

@implementation YouTubeWebView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        // Initialization code
    }
    return self;
}

-(void) setupWithYouTubeURL:(NSString*)youTubeUrl
{
    int width= self.frame.size.width;
    int height= self.frame.size.height;
    self.scrollView.scrollEnabled = NO;
    [self setBackgroundColor:[UIColor blackColor]];
    NSString* html = [NSString stringWithFormat: @"<html> \
                      <head>\
                      <style type=\"text/css\">body {background-color: black;color: black;}</style>\
                      </head>\
                      <body style=\"margin:0\">\
                      <iframe src=\"%@?playsinline=1&rel=0&showinfo=0\" width=\"%d\" height=\"%d\" frameborder=\"0\" allowfullscreen></iframe>\
                      </body>\
                      </html>",youTubeUrl, width,height];
    [self loadHTMLString:html baseURL:nil];
    [self setMediaPlaybackRequiresUserAction:NO];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
