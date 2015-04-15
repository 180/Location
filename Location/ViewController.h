//
//  ViewController.h
//  Location
//
//  Created by Maciej Stanik on 15/04/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

- (IBAction)getLocation:(id)sender;

@end

