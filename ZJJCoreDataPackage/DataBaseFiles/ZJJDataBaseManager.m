//
//  DataBaseManager.m
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//

#define XCDATA_MODELD_NAME   @"ZJJCoreDataPackage"

#import "ZJJDataBaseManager.h"

@implementation ZJJDataBaseManager

+ (instancetype)sharedSingleInstance {
    static dispatch_once_t onceToken;
    static ZJJDataBaseManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[ZJJDataBaseManager alloc] init];
    });
    return manager;
}

- (NSManagedObjectContext *)context {
    if (!_context) {
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _context;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        NSURL *sqlUrl = [NSURL fileURLWithPath:[self obtainDataPath]];
        NSError *error = nil;
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:nil error:&error];
        if (error) {
            NSLog(@"添加数据库失败:%@",error);
        } else {
            NSLog(@"添加数据库成功");
        }
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:XCDATA_MODELD_NAME withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

- (void)saveData {
    NSError *error = nil;
    if ([self.context save:&error]) {
        NSLog(@"%@", @"数据插入到数据库成功");
    }else{
        NSLog(@"%@", [NSString stringWithFormat:@"数据插入到数据库失败, %@",error]);
    }
}

- (NSString *)obtainDataPath {
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlPath = [docStr stringByAppendingPathComponent:@"ZJJCoreDataPackage.sqlite"];
    return sqlPath;
}

@end
