//
//  NSManagedObjectContext+Article.m
//  KVCMappingTest
//
//  Created by Romain Rolland on 10/07/2015.
//  Copyright (c) 2015 Romain Rolland. All rights reserved.
//

#import "NSManagedObjectContext+Article.h"
#import "KVCMapping/KVCMapping/KVCMapping.h"
#import "Article.h"


@implementation NSManagedObjectContext (Article)

- (void)importArticles:(NSArray *)theArticles {
    
    
    
    
    NSDictionary * mapping = @{@"titleArticle" : @"title",
                               @"descArticle" : @"descrition",
                               @"likeCounts" : @"like_count",
                               @"creationDate" : @"ISO8601StringToDate:creation_date",
                               @"isOnline" : @"is_online",
                               };
    
    
    for(NSDictionary * articleDictionary in theArticles)
    {
        Article *article = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:self];
        [article kvc_setValues:articleDictionary withMappingDictionary:mapping options:0];
    }
    
    [self save:nil];
    
}


- (NSArray *)readAllArticles {
    NSArray *fetchedObjects;
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Article" inManagedObjectContext:self];
    [fetch setEntity:entityDescription];
    //[fetch setPredicate:[NSPredicate predicateWithFormat:@"is_online = 1"]];
    NSError * error = nil;
    fetchedObjects = [self executeFetchRequest:fetch error:&error];
    
    if([fetchedObjects count] > 0)
        return fetchedObjects;
    else
        return nil;
}

@end

