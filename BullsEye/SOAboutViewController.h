//
//  SOAboutViewController.h
//  BullsEye
//
//  Created by Sean on 9/5/14.
//  Copyright (c) 2014 Sean O'Keeffe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOAboutViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIWebView *webView;

- (IBAction)close;

@end
