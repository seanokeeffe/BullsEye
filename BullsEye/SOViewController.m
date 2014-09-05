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

/**
 * Hide the top status bar
 */
- (BOOL)prefersStatusBarHidden
{
    
    return YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startNewRound]; // start the game
    
    // Custom slider button image
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [_slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    // Custom slider button image when highlighted
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [_slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    // Custom slider left of the button
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [_slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    // Custom slider right of the button
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [_slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
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
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
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

/**
 * When the alert view is dismissed this method is called.
 * It resets the game but ensures that it won't happen till the alert is dismissed
 */
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    [self startNewRound];
    
}

/**
 * Called when the 'Start Over' button is clicked
 */
- (IBAction)startOver
{
    
    [self startNewGame];
    
}

/**
 * A method that clears the users stats and starts a new game
 */
- (void)startNewGame
{
    
    // reset the user stats
    _score = 0;
    _round = 0;
    
    // start a new round
    [self startNewRound];
    
}

@end
