//
//  TTSong.h
//  Turntable.FM
//
//  Created by Colin Regan on 2/13/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTSongStats.h"

@interface TTSong : NSObject

@property (strong, nonatomic) NSString *datePlayed;
@property (strong, nonatomic) NSString *DJName;
@property (strong, nonatomic) NSString *songTitle;
@property (strong, nonatomic) NSString *artistName;
@property (strong, nonatomic) TTSongStats *stats;

+ (id)song;

@end
