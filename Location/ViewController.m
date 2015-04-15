//
//  ViewController.m
//  Location
//
//  Created by Maciej Stanik on 15/04/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CLLocationManager *_locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocationManager];
    [_locationManager startUpdatingLocation];
}

- (IBAction)getLocation:(id)sender {
    [_locationManager startUpdatingLocation];
}

#pragma mark Location methods

- (void)setupLocationManager {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *currentLocation = [locations lastObject];
    
    if (currentLocation != nil) {
        _longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %.4f", currentLocation.coordinate.longitude];
        _latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %.4f:", currentLocation.coordinate.latitude];
    }
    [_locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Application failed to get your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [errorAlert show];
}

@end
