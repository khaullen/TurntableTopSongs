//
//  TTSong.m
//  Turntable.FM
//
//  Created by Colin Regan on 2/13/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import "TTSong.h"

@implementation TTSong

@synthesize datePlayed = _datePlayed;
@synthesize DJName = _DJName;
@synthesize songTitle = _songTitle;
@synthesize artistName = _artistName;
@synthesize stats = _stats;

+ (id)song
{
    return [[self alloc] init];
}

- (TTSongStats *)stats
{
    if (!_stats) _stats = [TTSongStats songStats];
    return _stats;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ by %@ (%@)", self.songTitle, self.artistName, self.stats.popularity];
}

@end
