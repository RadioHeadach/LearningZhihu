//
//  StoriesModel.h
//  知乎
//
//  Created by ROOSTERLIN on 2017/1/12.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoriesModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *ga_prefix;
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, assign)long long id;


@end
