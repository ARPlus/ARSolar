//
//  Replay.h
//  ARSolar
//
//  Created by 文刀 on 2017/8/26.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReplayKit/ReplayKit.h>

@protocol ReplayDelegate <NSObject>

@optional

/**
 *  开始录制回调
 */
-(void)replayRecordStart;

/**
 *  录制结束或错误回调
 */
-(void)replayRecordFinishWithVC:(RPPreviewViewController *)previewViewController errorInfo:(NSString *)errorInfo;

/**
 *  保存到系统相册成功回调
 */
-(void)saveSuccess;


@end

//系统版本需要是iOS9.0及以上才支持ReplayKit框架录制
@interface Replay : NSObject

/**
 *  代理
 */
@property (nonatomic,weak) id <ReplayDelegate> delegate;

/**
 *  是否正在录制
 */
@property (nonatomic,assign,readonly) BOOL isRecording;

/**
 *  单例对象
 */
+(instancetype)sharedReplay;

/**
 *  开始录制
 */
-(void)startRecord;

/**
 *  结束录制
 *  isShow是否录制完后自动展示视频预览页
 */
-(void)stopRecordAndShowVideoPreviewController:(BOOL)isShow;






@end

