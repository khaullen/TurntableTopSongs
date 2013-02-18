//
//  TTSongStats.h
//  Turntable.FM
//
//  Created by Colin Regan on 2/14/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTSongStats : NSObject

@property NSInteger awesomes;
@property NSInteger lames;
@property NSInteger hearts;
@property NSInteger listeners;
@property (strong, nonatomic) NSNumber *popularity;

+ (id)songStats;

@end
