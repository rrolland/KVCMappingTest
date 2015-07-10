//
//  Article.h
//  KVCMappingTest
//
//  Created by Romain Rolland on 10/07/2015.
//  Copyright (c) 2015 Romain Rolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Article : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * descrition;
@property (nonatomic, retain) NSNumber * like_count;
@property (nonatomic, retain) NSDate * creation_date;
@property (nonatomic, retain) NSNumber * is_online;

@end
