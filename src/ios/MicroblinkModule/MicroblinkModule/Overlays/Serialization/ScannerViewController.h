//
//  ScannerViewController.h
//  pdf417-sample-Swift
//
//  Created by Pavel Vilbik on 10/8/18.
//  Copyright © 2018 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MicroBlink/MicroBlink.h>
#import "MBOverlayViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScannerViewController : MBCustomOverlayViewController <MBScanningRecognizerRunnerViewControllerDelegate>

@property (nonatomic, weak) id<MBOverlayViewControllerDelegate> delegate;
+ (instancetype)initFromStoryboardWith;

@end

NS_ASSUME_NONNULL_END
