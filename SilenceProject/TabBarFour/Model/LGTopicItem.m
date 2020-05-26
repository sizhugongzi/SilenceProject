//
//  LGTopicItem.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/14.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGTopicItem.h"
#import "LGCommentItem.h"
#import <MJExtension/MJExtension.h>

@implementation LGTopicItem

- (void)setTop_cmt:(NSArray *)top_cmt
{
    _top_cmt = top_cmt;
    
    if (_top_cmt.count) {
        NSDictionary *cmtDict = _top_cmt.firstObject;
        
        //字典转模型
        _top_cmt = [LGCommentItem mj_objectArrayWithKeyValuesArray:cmtDict];
    }
}

@end
