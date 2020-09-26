//
//  DataBaseManager.h
//  ZJJCoreDataPackage
//
//  Created by admin on 2020/9/25.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJJDataBaseManager : NSObject

+ (instancetype)sharedSingleInstance;

- (void)saveData;

- (NSString *)obtainDataPath;

///context
@property (nonatomic, strong) NSManagedObjectContext *context;

///managedObjectModel
@property(nonatomic, strong) NSManagedObjectModel *managedObjectModel;

///persistentStoreCoordinator
@property(nonatomic, strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

NS_ASSUME_NONNULL_END
