//
//  LGTopicViewModel.h
//  LGBuDeJie
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGTopicItem;
NS_ASSUME_NONNULL_BEGIN

@interface LGTopicViewModel : UIView

@property (nonatomic,copy) LGTopicItem *topicItem;
@property (nonatomic,assign) CGRect topViewFrame;
@property (nonatomic,assign) CGRect middleViewFrame;
@property (nonatomic,assign) CGRect commentViewFrame;
@property (nonatomic,assign) CGRect bottomViewFrame;
@property (nonatomic,assign) CGFloat cellH;

@end

NS_ASSUME_NONNULL_END
