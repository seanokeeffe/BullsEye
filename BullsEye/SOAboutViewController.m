//
//  SOAboutViewController.m
//  BullsEye
//
//  Created by Sean on 9/5/14.
//  Copyright (c) 2014 Sean O'Keeffe. All rights reserved.
//

#import "SOAboutViewController.h"

@interface SOAboutViewController ()

@end

@implementation SOAboutViewController

/**
 * Hide the top status bar
 */
- (BOOL)prefersStatusBarHidden
{
    
    return YES;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get the html file
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"BullsEye" ofType:@"html"];
    // get the data from the html file
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    // set up a local url
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    // display the web content
    [_webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Method that gets called when the 'Close' button is clicked
 * Dismisses this view controller
 */
- (IBAction)close
{
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
