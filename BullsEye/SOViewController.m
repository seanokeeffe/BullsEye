//
//  SOViewController.m
//  BullsEye
//
//  Created by Sean on 9/3/14.
//  Copyright (c) 2014 Sean O'Keeffe. All rights reserved.
//

#import "SOViewController.h"

@interface SOViewController ()

@end

@implementation SOViewController
{
    int _currentValue; // carries the current slider value
    
    int _targetValue; // The number the user wants the slider to get to
    
    int _score; // the players score
    
    int _round; // the number of times the player has played
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startNewRound];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Called when the 'Hit Me!' button is pressed. 
 * Alerts pops up to the user, right now celebrates first app.
 */
- (IBAction)showAlert
{
    
    // calculate the difference and points earned
    int difference = [self calcDifference];
    int points = 100 - difference;
    
    // add to user stats
    _score += points;
    _round += 1;
    
    // customize title of alert based on user performance
    // also add bonus points for good play
    NSString *title;
    if ( difference == 0 ) {
        title = @"Perfect!";
        points += 100;
    } else if ( difference < 5 ) {
        title = @"You almost had it!";
        if ( difference == 1 ) {
            points += 50;
        }
    } else if ( difference < 10 ) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close ... ";
    }
    
    // construct the alert message
    NSString *message = [NSString stringWithFormat:@"You scored %d points.", points];
    
    // construct the alert and display it
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
    [self startNewRound];
    
}

/**
 * Called when the slider value changes.
 * Currently logs the slider value.
 */
- (IBAction)sliderMoved:(UISlider *)slider
{
    
    _currentValue = lroundf(slider.value);
    
}

/**
 * Reset the slider to the middle, and re-generate a new target.
 * Also reset the _currentValue variable.
 */
- (void)startNewRound
{
    
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    _slider.value = _currentValue;
    
    [self updateLabels];
    
}

/**
 * Update the Label on the view that indicates the target number.
 */
- (void)updateLabels
{

    _targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    
    _scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    
    _roundLabel.text = [NSString stringWithFormat:@"%d", _round];
    
}

/**
 * Calculate the difference between the slider position and the target.
 */
- (int)calcDifference
{
    
    int difference = abs(_targetValue - _currentValue);
    
    return difference;
    
}

@end
