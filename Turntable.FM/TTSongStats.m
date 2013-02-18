//
//  TTSongStats.m
//  Turntable.FM
//
//  Created by Colin Regan on 2/14/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import "TTSongStats.h"

@implementation TTSongStats

+ (id)songStats
{
    return [[self alloc] init];
}

- (NSNumber *)popularity
{
    if (!_popularity) {
        double calculatedScore = 100 * (self.awesomes - self.lames + 2 * self.hearts) / self.listeners;
        _popularity = [NSNumber numberWithDouble:calculatedScore];
    }
    return _popularity;
}

@end
