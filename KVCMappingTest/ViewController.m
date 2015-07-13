//
//  ViewController.m
//  KVCMappingTest
//
//  Created by Romain Rolland on 10/07/2015.
//  Copyright (c) 2015 Romain Rolland. All rights reserved.
//

@import CoreData;

#import "ViewController.h"
#import "NSManagedObjectContext+Article.h"
#import "Article.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self saveArticlesFromJsonFile:@"articles"];
    
    NSArray *articleArray = [self.moc readAllArticles];
    
    for (Article *article in articleArray) {
        NSLog(@"New Article : %@ - %@ - %@, %@", article.title, article.descrition, article.creation_date, article.like_count);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)saveArticlesFromJsonFile:(NSString *)theFile {
    
    NSString *localJson = [[NSBundle mainBundle] pathForResource:theFile ofType:@"json"];
    
    if (localJson) {
        NSData *jsonContent = [NSData dataWithContentsOfFile:localJson];
        NSArray *object = [NSJSONSerialization JSONObjectWithData:jsonContent
                                                    options:0
                                                      error:nil];
        
        [self.moc importArticles:object];
    }
}



@end
