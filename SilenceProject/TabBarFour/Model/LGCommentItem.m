//
//  LGCommentItem.m
//  LGBuDeJie
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
//

#import "LGCommentItem.h"
#import "LGUserItem.h"

@implementation LGCommentItem

-(NSString *) totalContent
{
    return [NSString stringWithFormat:@"%@:%@",self.userItem.username,self.content];
}

@end
