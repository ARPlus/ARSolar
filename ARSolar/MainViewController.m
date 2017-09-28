//
//  ViewController.m
//  ARSolar
//
//  Created by wendao on 2017/7/7.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import "MainViewController.h"
#import "SolarViewController.h"
#import "SettingViewController.h"
#import "BaiduMobStat.h"
 #import <sys/utsname.h>

@interface MainViewController ()
@property (weak,nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize=CGSizeMake(375,1000);

    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[BaiduMobStat defaultStat] pageviewStartWithName:@"Main"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[BaiduMobStat defaultStat] pageviewEndWithName:@"Main"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
- (IBAction)btnClicked:(id)sender {
    
    if( [[MainViewController deviceModelName] isEqualToString:@"NOT"])
    {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"DeAuContent", comment: @"访问限制说明") message:nil delegate:self cancelButtonTitle:NSLocalizedString(@"IKnow", comment: @"我知道了") otherButtonTitles:nil];
        [view show];
        [[BaiduMobStat defaultStat] logEvent:@"main_fail_click" eventLabel:@"停止"];

    }
    else
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Solar" bundle:nil];
        SolarViewController *solarVC= [storyBoard instantiateViewControllerWithIdentifier:@"SolarViewController"];
        _solarView = solarVC;
        [self presentViewController:solarVC animated:NO completion:nil];
        [[BaiduMobStat defaultStat] logEvent:@"main_solar_click" eventLabel:@"首页点击打开"];
    }
}


- (IBAction)settingClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingViewController *settingVC= [storyBoard instantiateViewControllerWithIdentifier:@"SettingViewController"];
    [self presentViewController:settingVC animated:YES completion:nil];
    [[BaiduMobStat defaultStat] logEvent:@"main_setting_click" eventLabel:@"首页设置点击"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

+ (NSString*)deviceModelName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"NOT";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"NOT";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"NOT";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"NOT";
    
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"NOT";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro";
    if ([deviceModel isEqualToString:@"i386"])         return @"NOT";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"NOT";
    
    if ([deviceModel isEqualToString:@"iPad4,4"]
        ||[deviceModel isEqualToString:@"iPad4,5"]
        ||[deviceModel isEqualToString:@"iPad4,6"])      return @"NOT";
    
    if ([deviceModel isEqualToString:@"iPad4,7"]
        ||[deviceModel isEqualToString:@"iPad4,8"]
        ||[deviceModel isEqualToString:@"iPad4,9"])      return @"NOT";
    
    return deviceModel;
}


@end
