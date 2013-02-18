//
//  main.m
//  Turntable.FM
//
//  Created by Colin Regan on 2/12/13.
//  Copyright (c) 2013 Red Cup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTParser.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        for (int i = 0; i < argc; i++) {
            NSString *string = [NSString stringWithUTF8String:argv[i]];
            NSLog(@"argument_%d: %@", i, string);
        }
        
        NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
        NSData *data = [NSData dataWithData:[input readDataToEndOfFile]];
        
        //NSURL *tutorialsUrl = [NSURL URLWithString:@"http://ttstats.info/room/indie_while_you_work"];
        //NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
        
        TTParser *parser = [TTParser parserWithData:data];
        [parser runParserRun];
    }
    return 0;
}

