//
//  LastestModel.h
//  知乎
//
//  Created by ROOSTERLIN on 2017/1/12.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StoriesModel;
@interface LastestModel : NSObject
@property (nonatomic, copy)NSString *date;
@property (nonatomic, strong)NSArray<StoriesModel*> *stories;
@property (nonatomic, strong)NSArray *top_stories;

@end
