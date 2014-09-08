//
//  ViewController.m
//  MAC_NFL_Demo
//
//  Created by MobileAppsCompany on 9/6/14.
//  Copyright (c) 2014 RGG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webview setBackgroundColor:[UIColor clearColor]];
    NSString* html = @"<html> \
    <head>\
    <style type=\"text/css\">body {background-color: transparent;color: white;}</style>\
    </head>\
    <body style=\"margin:0\">\
    <iframe src=\"http://www.youtube.com/embed/e2w8z6mI47U?playsinline=1&rel=0&showinfo=0\" width=\"320\" height=\"240\" frameborder=\"0\" allowfullscreen></iframe>\
    </body>\
    </html>";
    [self.webview loadHTMLString:html baseURL:nil];
    [self.webview setMediaPlaybackRequiresUserAction:NO];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
