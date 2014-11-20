//  PDFViewerViewController.h
//
//  Created by Pierre-Emmanuel Bois on 8/23/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@interface PDFViewerViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate> {
    BOOL isStatusBarHidden;
    CGPoint lastOffset;
    CDVInvokedUrlCommand *command;
    IBOutlet UIWebView *webView;
    IBOutlet UIBarButtonItem *barButton;
    IBOutlet UINavigationItem *navItem;
}
@property (nonatomic,retain) NSString* fileURL;
@property (nonatomic,retain) NSString* fileTitle;
@property (nonatomic,retain) CDVInvokedUrlCommand *command;
@property (nonatomic,retain) CDVPlugin *plugin;
- (IBAction)close;
- (void)setPlugin:(CDVPlugin *)cdvPlugin;

@end
