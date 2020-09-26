//
//  ViewController.m
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//

#import "ViewController.h"
#import "ZJJDataBaseManager.h"
#import "People+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNewData];
    [self changeData];
    NSArray *arr = [self queryData];
    NSLog(@"arr=%@---path=%@", arr, [[ZJJDataBaseManager sharedSingleInstance] obtainDataPath]);
    
}

/// 新增数据
- (void)addNewData {
    People *p = [NSEntityDescription insertNewObjectForEntityForName:@"People" inManagedObjectContext:[ZJJDataBaseManager sharedSingleInstance].context];
    p.name = @"zjj";
    p.age = 45;
    p.sex = 1;
    [[ZJJDataBaseManager sharedSingleInstance] saveData];
}

/// 删除数据
- (void)deleteData {
    NSEntityDescription *des = [NSEntityDescription entityForName:@"People" inManagedObjectContext:[ZJJDataBaseManager sharedSingleInstance].context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:des];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@", @"zjj"];
    [request setPredicate:predicate];
    NSArray *array = [[ZJJDataBaseManager sharedSingleInstance].context executeFetchRequest:request error:nil];
    for (People *p in array) {
        [[ZJJDataBaseManager sharedSingleInstance].context deleteObject:p];
    }
    [[ZJJDataBaseManager sharedSingleInstance] saveData];
}

/// 修改数据
- (void)changeData {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"People"            inManagedObjectContext:[ZJJDataBaseManager sharedSingleInstance].context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@", @"zjj"];
    [request setPredicate:predicate];
    NSArray *resultArray = [[ZJJDataBaseManager sharedSingleInstance].context executeFetchRequest:request error:nil];
    for (People *p in resultArray) {
        p.name = @"xtayqria";
    }
    [[ZJJDataBaseManager sharedSingleInstance] saveData];
}

/// 查询数据
- (NSArray *)queryData {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"People" inManagedObjectContext:[ZJJDataBaseManager sharedSingleInstance].context];
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:true];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    request.sortDescriptors = @[sort];
    request.entity = entity;
    NSArray *arr = [[ZJJDataBaseManager sharedSingleInstance].context executeFetchRequest:request error:nil];
    return arr;
}

@end
