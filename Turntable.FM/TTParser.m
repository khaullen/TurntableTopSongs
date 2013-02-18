//
//  TTParser.m
//  Turntable.FM
//
//  Created by Colin Regan on 2/14/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import "TTParser.h"

@implementation TTParser

#define XPATH_QUERY @"//div[@id='user-songs']/div[@class='song']"
#define POPULARITY_THRESHOLD 20

+ (id)parserWithData:(NSData *)data
{
    return [[self alloc] initWithData:data];
}

- (id)initWithData:(NSData *)data
{
    self = [self init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (BOOL)runParserRun
{
    TFHpple *songParser = [TFHpple hppleWithHTMLData:self.data];
    NSArray *songNodes = [songParser searchWithXPathQuery:XPATH_QUERY];
    NSFileHandle *stdout = [NSFileHandle fileHandleWithStandardOutput];

    for (TFHppleElement *element in songNodes) {
        TTSong *newSong = [TTSong song];
        
        TFHppleElement *p = [element.children objectAtIndex:1];
        for (int i = 0; i < 6; i++) {
            TFHppleElement *subElement = [p.children objectAtIndex:i];
            switch (i) {
                case 0: newSong.datePlayed = [[self class] parseDate:subElement.content]; break;
                case 1: newSong.DJName = subElement.firstChild.content; break;
                case 4: newSong.songTitle = subElement.firstChild.content; break;
                case 5: newSong.artistName = [[self class] parseArtist:subElement.content]; break;
                default: break;
            }
        }

        TFHppleElement *ul = [element.children objectAtIndex:3];
        for (int i = 0; i < 7; i++) {
            TFHppleElement *subElement = [ul.children objectAtIndex:i];
            NSInteger subElementInteger = [[[subElement.children lastObject] content] integerValue];
            switch (i) {
                case 0: newSong.stats.awesomes = subElementInteger; break;
                case 2: newSong.stats.lames = subElementInteger; break;
                case 4: newSong.stats.hearts = subElementInteger; break;
                case 6: newSong.stats.listeners = subElementInteger; break;
                default: break;
            }
        }
        
        // print song info
        if ([newSong.stats.popularity integerValue] >= POPULARITY_THRESHOLD) {
            NSString *songDescription = [newSong.description stringByAppendingString:@"\n"];
            NSData *songData = [songDescription dataUsingEncoding:NSUTF8StringEncoding];
            [stdout writeData:songData];
        }
        
    }
    
    return 0;
}

+ (NSString *)parseDate:(NSString *)string
{
    //"On Feb 12th, 2013 at 10:11:48pm CST, "
    NSInteger end = [string length] - 5;
    NSRange range = NSRangeFromString([NSString stringWithFormat:@"3 %ld", end]);
    return [string substringWithRange:range];
}

+ (NSString *)parseArtist:(NSString *)string
{
    return [string substringFromIndex:4];
}

@end
