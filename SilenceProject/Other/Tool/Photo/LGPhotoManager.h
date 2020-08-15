//
//  LGPhotoManager.h
//  LGBuDeJie
//
//  Created by Silence on 2017/8/23.
//  Copyright © 2017 Silence.L All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPhotoManager : NSObject

+ (void)savePhoto:(UIImage *)image albumTitle:(NSString *)albumTitle completionHandler:(void(^)(BOOL success, NSError * error))completionHandler;

@end

NS_ASSUME_NONNULL_END
