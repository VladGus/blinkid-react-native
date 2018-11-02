//
//  ScannerViewController.m
//  pdf417-sample-Swift
//
//  Created by Pavel Vilbik on 10/8/18.
//  Copyright © 2018 Dino. All rights reserved.
//

#import "ScannerViewController.h"

@interface ScannerViewController ()
@property (weak, nonatomic) IBOutlet UIView *borderView;

@end

@implementation ScannerViewController

+ (instancetype)initFromStoryboardWith {
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"MicroblinkModuleResources.bundle/"];
    ScannerViewController *scanner = (ScannerViewController *)[[UIStoryboard storyboardWithName:@"Scanner" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    return scanner;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.borderView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.borderView.layer.borderWidth = 3.0;
    
    super.scanningRecognizerRunnerViewControllerDelegate = self;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)recognizerRunnerViewController:(UIViewController<MBRecognizerRunnerViewController> *)recognizerRunnerViewController didFinishScanningWithState:(MBRecognizerResultState)state {
    
    [self.delegate overlayViewControllerDidFinishScanning:self state:state];
}

- (IBAction)cancelPressed:(id)sender {
    [self.delegate overlayDidTapClose:self];
}

@end
