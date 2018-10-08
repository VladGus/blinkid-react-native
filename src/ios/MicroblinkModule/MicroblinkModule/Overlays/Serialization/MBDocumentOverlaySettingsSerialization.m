//
//  MBDocumentOverlaySettingsSerialization.m
//  BlinkIdDevDemo
//
//  Created by DoDo on 04/06/2018.
//

#import "MBDocumentOverlaySettingsSerialization.h"
#import "MBOverlaySerializationUtils.h"
#import "ScannerViewController.h"

@interface MBDocumentOverlaySettingsSerialization ()

@property (nonatomic, weak) id<MBOverlayViewControllerDelegate> delegate;

@end

@implementation MBDocumentOverlaySettingsSerialization

@synthesize jsonName = _jsonName;

-(instancetype) init {
    self = [super init];
    if (self) {
        _jsonName = @"DocumentOverlaySettings";
    }
    return self;
}

-(MBOverlayViewController *) createOverlayViewController:(NSDictionary *)jsonOverlaySettings recognizerCollection:(MBRecognizerCollection*)recognizerCollection delegate:(id<MBOverlayViewControllerDelegate>) delegate {
    // no settings deserialized at the moment
    MBDocumentOverlaySettings *sett = [[MBDocumentOverlaySettings alloc] init];
    self.delegate = delegate;
    [MBOverlaySerializationUtils extractCommonOverlaySettings:jsonOverlaySettings overlaySettings:sett];
    ScannerViewController *controller = [ScannerViewController initFromStoryboardWith];
    controller.delegate = self;
    [controller reconfigureRecognizers:recognizerCollection];
    return controller;
}

- (void)documentOverlayViewControllerDidFinishScanning:(nonnull MBDocumentOverlayViewController *)documentOverlayViewController state:(MBRecognizerResultState)state {
    [self.delegate overlayViewControllerDidFinishScanning:documentOverlayViewController state:state];
}

- (void)documentOverlayViewControllerDidTapClose:(nonnull MBDocumentOverlayViewController *)documentOverlayViewController {
    [self.delegate overlayDidTapClose:documentOverlayViewController];
}

@end
