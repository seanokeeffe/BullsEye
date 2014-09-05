//
//  SOViewController.h
//  BullsEye
//
//  Created by Sean on 9/3/14.
//  Copyright (c) 2014 Sean O'Keeffe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;

@property (nonatomic, weak) IBOutlet UILabel *targetLabel;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;

@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)slider;

@end
