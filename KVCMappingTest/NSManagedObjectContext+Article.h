//
//  NSManagedObjectContext+Article.h
//  KVCMappingTest
//
//  Created by Romain Rolland on 10/07/2015.
//  Copyright (c) 2015 Romain Rolland. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Article)

- (void)importArticles:(NSArray *)theArticles;
- (NSArray *)readAllArticles;

@end
