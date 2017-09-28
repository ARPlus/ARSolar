//
//  SettingViewController.m
//  ARSolar
//
//  Created by 文刀 on 2017/8/24.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "SettingViewController.h"
#import "BaiduMobStat.h"
@interface SettingViewController ()
@property UIActivityIndicatorView *indicatorView;

@end

@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[BaiduMobStat defaultStat] pageviewStartWithName:@"Setting"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[BaiduMobStat defaultStat] pageviewEndWithName:@"Setting"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
- (IBAction)albumClicked:(id)sender {
    [self openUrl:@"https://itunes.apple.com/us/app/id1270095320"];
    [[BaiduMobStat defaultStat] logEvent:@"setting_album_click" eventLabel:@"ar相册"];

    
}
- (IBAction)rulerClicked:(id)sender {
    [self openUrl:@"https://itunes.apple.com/us/app/id1269968846"];
    [[BaiduMobStat defaultStat] logEvent:@"setting_ruler_click" eventLabel:@"ar量尺子"];


}
- (IBAction)solarClicked:(id)sender {
    [self openUrl:@"https://itunes.apple.com/us/app/id1270095769"];
    [[BaiduMobStat defaultStat] logEvent:@"setting_solar_click" eventLabel:@"给我评分"];
}

- (IBAction)brushClicked:(id)sender {
    [self openUrl:@"https://itunes.apple.com/us/app/id1273579764"];
    [[BaiduMobStat defaultStat] logEvent:@"setting_brush_click" eventLabel:@"ar画笔"];
}

- (IBAction)tetrisClicked:(id)sender {
    [self openUrl:@"https://itunes.apple.com/us/app/id1276498269"];
    [[BaiduMobStat defaultStat] logEvent:@"setting_tetris_click" eventLabel:@"ar画笔"];
    
}

- (IBAction)creditsClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingViewController *settingVC= [storyBoard instantiateViewControllerWithIdentifier:@"CreditsViewController"];
    [self presentViewController:settingVC animated:YES completion:nil];
    [[BaiduMobStat defaultStat] logEvent:@"setting_credits_click" eventLabel:@"首页设置点击"];

}


- (IBAction)feedbackClicked:(id)sender {
    [[BaiduMobStat defaultStat] logEvent:@"setting_feedback_click" eventLabel:@"意见反馈"];
    
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defs objectForKey:@"AppleLanguages"];
    NSString *dLanguage = [languages objectAtIndex:0];

    if ([dLanguage isEqualToString:@"zh-Hans-CN"])
    {
        [self openUrl:@"https://smgui.kf5.com/kchat/29489"];
        
    }else
    {
        [self openUrl:@"mailto:developer@yaoyouguang.net"];
    }
    

}

-(void)openUrl:(NSString*)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)showStoreProductInApp:(NSString *)appID{
    [self showIndicator];
    Class isAllow = NSClassFromString(@"SKStoreProductViewController");
    
    if (isAllow != nil) {
        
        SKStoreProductViewController *sKStoreProductViewController = [[SKStoreProductViewController alloc] init];
        [sKStoreProductViewController.view setFrame:CGRectMake(0, 200, 320, 200)];
        [sKStoreProductViewController setDelegate:self];
        [sKStoreProductViewController loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier: appID}
                                                completionBlock:^(BOOL result, NSError *error) {
                                                    if (result) {
                                                        [self presentViewController:sKStoreProductViewController
                                                                           animated:YES
                                                                         completion:nil];

                                                    }else{
                                                        NSLog(@"error:%@",error);
                                                    }
                                                }];
    }else{
        //低于iOS6的系统版本没有这个类,不支持这个功能
        NSString *string = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/xxxxxxx/app/id%@?mt=8",appID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)hideIndicator
{
    [self.indicatorView stopAnimating];
}
- (void)showIndicator
{
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:self.indicatorView];
    [self.indicatorView sizeToFit];
    [self.indicatorView startAnimating];
    self.indicatorView.center = self.view.center;
}
-(void) productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self hideIndicator];
}


@end
