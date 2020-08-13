//
//  LGTopicItem.m
//  LGBuDeJie
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
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
