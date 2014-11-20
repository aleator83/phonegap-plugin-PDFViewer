//  PDFViewer.m
//
//  Created by Pierre-Emmanuel Bois on 08/08/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

#import "PDFViewer.h"
#import <Cordova/CDVPlugin.h>

@implementation PDFViewer

- (void)open:(CDVInvokedUrlCommand*)command
{
    NSString* url = [command.arguments objectAtIndex:0];
    NSString* fileTitle = [command.arguments objectAtIndex:1];
    if (url != nil && [url length] > 0) {

        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray * dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

            NSString * pdfFile = [[dirPath objectAtIndex:0] stringByAppendingPathComponent:[command argumentAtIndex:0]];
            NSLog(@"pdfFile to show : %@", pdfFile);
            if (pdfFile) {
                pdfviewerViewController = [[UIStoryboard storyboardWithName:@"PDFViewerViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"PDFViewer"];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:pdfviewerViewController];
                [pdfviewerViewController setPlugin:self];
                [pdfviewerViewController setCommand:command];
                [pdfviewerViewController setFileURL:pdfFile];
                if (fileTitle != nil && [fileTitle length] > 0) {
                    [pdfviewerViewController setFileTitle:fileTitle];
                }
                
                [[self viewController] presentViewController:navigationController animated:YES completion:nil];
            }
        });
    } else {
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end
