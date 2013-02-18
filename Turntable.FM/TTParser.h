//
//  TTParser.h
//  Turntable.FM
//
//  Created by Colin Regan on 2/14/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "TTSong.h"

@interface TTParser : NSObject

@property (strong, nonatomic) NSData *data;

+ (id)parserWithData:(NSData *)data;
- (id)initWithData:(NSData *)data;

- (BOOL)runParserRun;

+ (NSString *)parseDate:(NSString *)string;
+ (NSString *)parseArtist:(NSString *)string;

@end
